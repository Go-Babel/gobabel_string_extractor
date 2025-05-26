import 'dart:io';
import 'package:args/args.dart';
import 'package:gobabel_string_extractor/gobabel_labels_extractor.dart';

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

    // Process the files
    final controller = GobabelStringExtractorController();
    await controller.extractAndProcessStrings(
      files: files,
      projectApiToken: projectApiToken,
      projectShaIdentifier: BigInt.parse(projectShaIdentifier),
      apiBaseUrl: apiBaseUrl,
    );
    print('String extraction completed successfully.');
  } catch (e) {
    stderr.writeln('Error during string extraction: $e');
    exit(1);
  }
}
