import 'dart:io';
import 'package:args/args.dart';
import 'package:gobabel_client/gobabel_client.dart';
import 'package:gobabel_string_extractor/gobabel_labels_extractor.dart';

/*
dart run gobabel_string_extractor/bin/gobabel_string_extractor.dart --api-key=01972dbd-59a4-7574-a796-80ae317e7876 --project-sha-identifier=325439440403537605558364609031590613901966306984930054075442972529951867760824221376735455794372 --path="go_babel_app/gobabel_flutter/"
*/
void main(List<String> args) async {
  // Parse command line arguments
  final parser = ArgParser()
    ..addOption('path', abbr: 'p', help: 'Directory to scan')
    ..addOption('api-key', abbr: 't', help: 'Project API token')
    ..addOption(
      'project-sha-identifier',
      abbr: 's',
      help: 'Project SHA identifier',
    )
    ..addOption(
      'api-base-url',
      defaultsTo: 'http://localhost:8080/',
      help: 'Base URL for the API',
    );

  ArgResults res;
  try {
    res = parser.parse(args);
  } catch (e) {
    stderr.writeln('Error parsing args: $e');
    exit(1);
  }

  // Get required parameters
  final targetDir = res['path'] as String?;
  final projectApiToken = res['api-key'] as String?;
  final projectShaIdentifier = res['project-sha-identifier'] as String?;
  final apiBaseUrl = res['api-base-url'] as String;

  if (projectApiToken == null || projectShaIdentifier == null) {
    stderr.writeln('Error: Project API token and SHA identifier are required');
    stderr.writeln(
      'Usage: dart run gobabel_string_extractor --api-key=<api_token> --project-sha-identifier=<sha_identifier> [--path=<directory>]',
    );
    exit(1);
  }

  // Validate directory
  final dir = targetDir == null ? Directory.current : Directory(targetDir);
  if (!dir.existsSync()) {
    stderr.writeln('Error: Directory not found: $targetDir');
    exit(1);
  }

  try {
    // Get eligible files for scanning
    print('Finding eligible files in ${dir.path}...');
    final files = await getEligibleFiles(dir);
    print('Found ${files.length} eligible files for scanning');

    // Create HTTP client
    final Client client = Client(
      apiBaseUrl,
      connectionTimeout: const Duration(seconds: 60),
    );

    // Process the files
    final controller = GobabelStringExtractorController(client: client);
    final Iterable<MapEntry<String, List<BabelLabelEntityRootLabel>>> results;

    try {
      results = await controller.extractAndProcessStrings(
        projectApiToken: projectApiToken,
        projectShaIdentifier: BigInt.parse(projectShaIdentifier),
        files: files,
        apiBaseUrl: apiBaseUrl,
        generateLogs: true,
      );
    } catch (e, s) {
      throw Exception(
        'Error during string extraction:\n$e\n\n\nStack trace: $s',
      );
    }
    // Replace hardcoded strings with babel function declarations
    for (final entry in results) {
      final filePath = entry.key;
      final babelLabels = entry.value;

      final file = File(filePath);
      if (!await file.exists()) {
        print('Warning: File not found: $filePath');
        continue;
      }

      String content = await file.readAsString();

      // Process labels (already sorted by fileStartIndex in descending order)
      for (final label in babelLabels) {
        final startIndex = label.fileStartIndex;
        final endIndex = label.fileEndIndex;
        final replacement = label.babelFunctionImplementation;

        // Replace the content
        content =
            content.substring(0, startIndex) +
            replacement +
            content.substring(endIndex);
      }

      // Write back to file
      await file.writeAsString(content);
      print('Updated file: $filePath');
    }
    print('String extraction completed successfully.');
  } catch (e) {
    stderr.writeln('Error during string extraction: $e');
    exit(1);
  }
}
