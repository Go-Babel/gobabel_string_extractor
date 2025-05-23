import 'dart:convert';
import 'dart:io';
import 'package:args/args.dart';
import 'package:gobabel_client/gobabel_client.dart';
import 'package:gobabel_string_extractor/src/usecases/create_human_friendly_arb_keys.dart';
import 'package:gobabel_string_extractor/src/usecases/define_which_string_label.dart';
import 'package:gobabel_string_extractor/src/usecases/extract_all_strings_usecase.dart';
import 'package:gobabel_string_extractor/src/usecases/map_babel_labels.dart';
import 'package:gobabel_string_extractor/src/usecases/map_strings_hierarchy.dart';
import 'package:gobabel_string_extractor/src/usecases/validate_candidate_string.dart';
import 'package:path/path.dart' as p;

void main(List<String> args) async {
  // Parse command line arguments
  final parser = ArgParser()
    ..addOption('path', abbr: 'p', help: 'Directory to scan')
    ..addOption('api-key', abbr: 't', help: 'Project API token')
    ..addOption(
      'project-sha-identifier',
      abbr: 's',
      help: 'Project SHA identifier',
    );

  ArgResults res;
  try {
    res = parser.parse(args);
  } catch (e) {
    stderr.writeln('Error parsing args: $e');
    exit(1);
  }

  // Get required parameters
  final target = res['path'] as String?;
  final projectApiToken = res['api-key'] as String?;
  final projectShaIdentifier = res['project-sha-identifier'] as String?;

  if (projectApiToken == null || projectShaIdentifier == null) {
    stderr.writeln('Error: Project API token and SHA identifier are required');
    stderr.writeln(
      'Usage: dart run gobabel_string_extractor --api-key=<api_token> --project-sha-identifier=<sha_identifier> [--path=<directory>]',
    );
    exit(1);
  }

  // Validate directory
  final dir = target == null ? Directory.current : Directory(target);
  if (!dir.existsSync()) {
    stderr.writeln('Directory not found: $target');
    exit(1);
  }

  // Create HTTP client
  final Client client = Client(
    'http://localhost:8080/',
    connectionTimeout: const Duration(seconds: 60),
  );

  // 1. Extract all strings from the directory
  print('Extracting strings from ${dir.path}...');
  final extractAllStringsUsecase = ExtractAllStringsInDartUsecaseImpl(
    validateCandidateStringUsecase: ValidateCandidateStringUsecase(),
  );
  const excludedFolders = [
    'android',
    'ios',
    'linux',
    'macos',
    'build',
    'web',
    'windows',
  ];

  final files = dir.listSync(recursive: true).whereType<File>().where((file) {
    // Normalize path separators for consistent splitting, then split into segments
    final pathSegments = p.split(file.path.replaceAll(r'\', '/'));
    for (final segment in pathSegments) {
      final segmentContainExcludeFolder = excludedFolders.any(
        (folder) => segment.contains(folder),
      );

      // ex: .dart_tool
      final segmentContainPrivateFolder =
          segment.contains('/.') || segment.startsWith('.');

      final isFreezedFile = file.path.endsWith('.freezed.dart');
      final isPartFile = file.path.endsWith('.part.dart');
      final isGeneratedFile = file.path.endsWith('.g.dart');
      if (segmentContainExcludeFolder ||
          segmentContainPrivateFolder ||
          isFreezedFile ||
          isPartFile ||
          isGeneratedFile) {
        return false; // Exclude this file if any part of its path is in excludedFolders
      }
    }
    return true; // Include this file
  }).toList();
  final allStrings = await extractAllStringsUsecase.call(files: files);
  print('Extracted ${allStrings.length} raw strings');
  final onlyStrings = allStrings.map((s) => s.toMap()).toList();
  final stringsOutFile = File(p.join(Directory.current.path, 'strings.json'));
  await stringsOutFile.writeAsString(
    JsonEncoder.withIndent('  ').convert(onlyStrings),
  );

  // 2. Define which strings are labels
  print('Analyzing which strings are displayable labels...');
  final defineWhichStringLabelUsecase =
      DefineWhichStringLabelWithAiOnServerUsecaseImpl(
        projectApiToken: projectApiToken,
        projectShaIdentifier: BigInt.parse(projectShaIdentifier),
        client: client,
      );
  final labelStrings = await defineWhichStringLabelUsecase.call(
    strings: allStrings,
  );
  print('Found ${labelStrings.length} displayable labels');

  // 3. Create human-friendly ARB keys
  print('Creating human-friendly ARB keys...');
  final createHumanFriendlyArbKeysUsecase =
      CreateHumanFriendlyArbKeysWithAiOnServerUsecaseImpl(
        projectApiToken: projectApiToken,
        projectShaIdentifier: BigInt.parse(projectShaIdentifier),
        client: client,
      );
  final keyedStrings = await createHumanFriendlyArbKeysUsecase.call(
    strings: labelStrings,
  );
  print('Created ${keyedStrings.length} ARB keys');

  // 4. Map strings hierarchy
  print('Mapping string hierarchy...');
  final mapStringsHierarchyUsecase = MapStringsHierarchyUsecaseImpl();
  final labelEntities = await mapStringsHierarchyUsecase.call(
    strings: keyedStrings,
  );
  print('Created hierarchy with ${labelEntities.length} root labels');

  // 5. Map to babel labels models
  final mapBabelLabelsUsecaseImpl = MapBabelLabelsUsecaseImpl();
  final babelLabels = mapBabelLabelsUsecaseImpl(strings: labelEntities);

  // Save the result to strings.json
  final jsonList = babelLabels.map((label) => label.toJson()).toList();
  // final jsonList = labelEntities.map((label) => label.toJson()).toList();
  final outFile = File(
    p.join(Directory.current.path, 'translated_result.json'),
  );
  outFile.writeAsStringSync(JsonEncoder.withIndent('  ').convert(jsonList));
  print('Saved results to ${outFile.path}');

  /*
  
   
  */
}
