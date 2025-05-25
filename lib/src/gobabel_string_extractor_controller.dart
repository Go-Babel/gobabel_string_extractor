import 'dart:convert';
import 'dart:io';
import 'package:gobabel_client/gobabel_client.dart';
import 'package:gobabel_string_extractor/src/usecases/create_human_friendly_arb_keys.dart';
import 'package:gobabel_string_extractor/src/usecases/define_which_string_label.dart';
import 'package:gobabel_string_extractor/src/usecases/extract_all_strings_usecase.dart';
import 'package:gobabel_string_extractor/src/usecases/map_babel_labels.dart';
import 'package:gobabel_string_extractor/src/usecases/map_strings_hierarchy.dart';
import 'package:gobabel_string_extractor/src/usecases/validate_candidate_string.dart';
import 'package:path/path.dart' as p;

class GobabelStringExtractorController {
  /// Extracts and processes strings from a list of files for internationalization.
  ///
  /// [files] - List of files to scan
  /// [projectApiToken] - Project API token for authentication
  /// [projectShaIdentifier] - Project SHA identifier
  /// [apiBaseUrl] - Base URL for the API (defaults to localhost)
  Future<void> extractAndProcessStrings({
    required List<File> files,
    required String projectApiToken,
    required String projectShaIdentifier,
    String apiBaseUrl = 'http://localhost:8080/',
  }) async {
    // Create HTTP client
    final Client client = Client(
      apiBaseUrl,
      connectionTimeout: const Duration(seconds: 60),
    );

    // 1. Extract all strings from the files
    print('Extracting strings from ${files.length} files...');
    final extractAllStringsUsecase = ExtractAllStringsInDartUsecaseImpl(
      validateCandidateStringUsecase: ValidateCandidateStringUsecase(),
    );

    final allStrings = await extractAllStringsUsecase.call(files: files);
    print('Extracted ${allStrings.length} raw strings');

    _saveStringData(allStrings.map((s) => s.toMap()).toList(), 'strings.json');

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

    // Save the result
    _saveStringData(
      babelLabels.map((label) => label.toJson()).toList(),
      'translated_result.json',
    );
  }

  /// Saves data to a JSON file
  void _saveStringData(List<Map<String, dynamic>> data, String fileName) {
    final outFile = File(p.join(Directory.current.path, fileName));
    outFile.writeAsStringSync(JsonEncoder.withIndent('  ').convert(data));
    print('Saved results to ${outFile.path}');
  }
}
