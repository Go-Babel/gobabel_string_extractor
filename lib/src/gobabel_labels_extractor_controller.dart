import 'dart:convert';
import 'dart:io';
import 'package:gobabel_client/gobabel_client.dart';
import 'package:gobabel_core/gobabel_core.dart';
import 'package:gobabel_string_extractor/src/entities/babel_label_entity.dart';
import 'package:gobabel_string_extractor/src/usecases/create_human_friendly_arb_keys.dart';
import 'package:gobabel_string_extractor/src/usecases/define_which_string_label.dart';
import 'package:gobabel_string_extractor/src/usecases/extract_all_strings_usecase.dart';
import 'package:gobabel_string_extractor/src/usecases/map_babel_labels.dart';
import 'package:gobabel_string_extractor/src/usecases/map_strings_hierarchy.dart';
import 'package:gobabel_string_extractor/src/usecases/validate_candidate_string.dart';
import 'package:path/path.dart' as p;

class GobabelStringExtractorController {
  final ExtractAllStringsInDartUsecaseImpl _extractAllStringsUsecase;
  final DefineWhichStringLabelWithAiOnServerUsecaseImpl
  _defineWhichStringLabelUsecase;
  final CreateHumanFriendlyArbKeysWithAiOnServerUsecaseImpl
  _createHumanFriendlyArbKeysUsecase;
  final MapStringsHierarchyUsecaseImpl _mapStringsHierarchyUsecase;
  final MapBabelLabelsUsecaseImpl _mapBabelLabelsUsecase;

  GobabelStringExtractorController({
    required Client client,
    GaranteeUniquenessOfArbKeysUsecase garanteeUniquenessOfArbKeysUsecase =
        const GaranteeUniquenessOfArbKeysUsecase(),
  }) : _extractAllStringsUsecase = ExtractAllStringsInDartUsecaseImpl(
         validateCandidateStringUsecase: ValidateCandidateStringUsecase(),
       ),
       _defineWhichStringLabelUsecase =
           DefineWhichStringLabelWithAiOnServerUsecaseImpl(client: client),
       _createHumanFriendlyArbKeysUsecase =
           CreateHumanFriendlyArbKeysWithAiOnServerUsecaseImpl(
             garanteeUniquenessOfArbKeysUsecase:
                 garanteeUniquenessOfArbKeysUsecase,
             client: client,
           ),
       _mapStringsHierarchyUsecase = MapStringsHierarchyUsecaseImpl(),
       _mapBabelLabelsUsecase = MapBabelLabelsUsecaseImpl();

  /// Extracts and processes strings from a list of files for internationalization.
  ///
  /// [files] - List of files to scan
  /// [projectApiToken] - Project API token for authentication
  /// [projectShaIdentifier] - Project SHA identifier
  /// [apiBaseUrl] - Base URL for the API (defaults to localhost)
  Future<Iterable<MapEntry<FilePath, List<BabelLabelEntityRootLabel>>>>
  extractAndProcessStrings({
    required List<File> files,
    required String projectApiToken,
    required BigInt projectShaIdentifier,

    String apiBaseUrl = 'http://localhost:8080/',
    bool generateLogs = false,
  }) async {
    // 1. Extract all strings from the files
    print('Extracting strings from ${files.length} files...');
    final allStrings = await runWithSpinner(
      successMessage: 'Extracted strings from ${files.length} files',
      message: 'Extracting strings from ${files.length} files...',
      () async {
        final allStrings = await _extractAllStringsUsecase(files: files);
        if (generateLogs) {
          print('Extracted ${allStrings.length} raw strings');
          await _saveStringData(
            allStrings.map((s) => s.toMap()).toList(),
            'step_one.json',
          );
        }
      },
    );

    // 2. Define which strings are labels
    print('Analyzing which strings are displayable labels...');
    final labelStrings = await _defineWhichStringLabelUsecase(
      strings: allStrings,
      projectApiToken: projectApiToken,
      projectShaIdentifier: projectShaIdentifier,
    );
    print('Found ${labelStrings.length} displayable labels');

    // 3. Create human-friendly ARB keys
    print('Creating human-friendly ARB keys...');
    final keyedStrings = await _createHumanFriendlyArbKeysUsecase(
      strings: labelStrings,
      projectApiToken: projectApiToken,
      projectShaIdentifier: projectShaIdentifier,
    );
    print('Created ${keyedStrings.length} ARB keys');

    // 4. Map strings hierarchy
    print('Mapping string hierarchy...');
    final labelEntities = await _mapStringsHierarchyUsecase(
      strings: keyedStrings,
    );
    print('Created hierarchy with ${labelEntities.length} root labels');

    // 5. Map to babel labels models
    final babelLabels = _mapBabelLabelsUsecase(strings: labelEntities);

    Map<FilePath, List<BabelLabelEntityRootLabel>> allHardcodedStrings =
        <FilePath, List<BabelLabelEntityRootLabel>>{};

    for (final babelLabel in babelLabels) {
      final filePath = babelLabel.filePath;
      if (allHardcodedStrings[filePath] == null) {
        allHardcodedStrings[filePath] = [];
      }
      allHardcodedStrings[filePath]!.add(babelLabel);
    }

    // Sort the entries by startIndex. The first should be the biggest index,
    // the last should be the smallest index
    allHardcodedStrings.forEach((key, value) {
      value.sort((a, b) {
        final aIndex = a.fileStartIndex;
        final bIndex = b.fileStartIndex;
        return aIndex.compareTo(bIndex); // Descending order
      });
    });

    // Save the result
    await _saveStringData(
      babelLabels.map((label) => label.toJson()).toList(),
      'translated_result.json',
    );

    return allHardcodedStrings.entries.toList();
  }

  /// Saves data to a JSON file
  Future<void> _saveStringData(
    List<Map<String, dynamic>> data,
    String fileName,
  ) async {
    final outFile = File(p.join(Directory.current.path, fileName));
    await outFile.writeAsString(JsonEncoder.withIndent('  ').convert(data));
    print('Saved results to ${outFile.path}');
  }
}
