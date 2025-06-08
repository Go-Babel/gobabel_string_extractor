// ignore_for_file: unused_element

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
       _mapBabelLabelsUsecase = MapBabelLabelsUsecaseImpl(
         inferDeclaration: InferDeclarationFunctionByArbValueUsecase(),
       );

  /// Extracts and processes strings from a list of files for internationalization.
  ///
  /// [files] - List of files to scan
  /// [projectApiToken] - Project API token for authentication
  /// [projectShaIdentifier] - Project SHA identifier
  /// [apiBaseUrl] - Base URL for the API (defaults to localhost)
  Future<ExtractorResponse> extractAndProcessStrings({
    required List<File> files,
    required String projectApiToken,
    required BigInt projectShaIdentifier,
    String apiBaseUrl = 'http://localhost:8080/',
    required Map<HardCodedString, TranslationKey>
    projectHardcodedStringKeyCache,
    bool generateLogs = false,
  }) async {
    if (generateLogs) print('Extracting strings from ${files.length} files...');

    // 1. Extract all strings from the files
    final allStrings = await runWithSpinner(
      successMessage: 'Extracted strings from ${files.length} files',
      message: 'Extracting strings from ${files.length} files...',
      () async {
        final allStrings = await _extractAllStringsUsecase(files: files);

        return allStrings;
      },
    );
    if (generateLogs) {
      await _saveStringListData(
        allStrings.map((s) => s.toMap()).toList(),
        'step_1.json',
      );
    }

    // 2. Define which strings are labels
    if (generateLogs) {
      print('Analyzing which strings are displayable labels...');
    }
    final labelStrings = await _defineWhichStringLabelUsecase(
      strings: allStrings,
      projectApiToken: projectApiToken,
      projectShaIdentifier: projectShaIdentifier,
    );

    if (labelStrings.isEmpty) {
      throw Exception(
        'No displayable labels found. Please check your files and try again.',
      );
    }

    if (generateLogs) {
      print('Found ${labelStrings.length} displayable labels');

      await _saveStringListData(
        labelStrings.map((s) => s.toMap()).toList(),
        'step_2.json',
      );
    }

    // 3. Create human-friendly ARB keys
    if (generateLogs) print('Creating human-friendly ARB keys...');
    final humanFriendlyResponse = await _createHumanFriendlyArbKeysUsecase(
      strings: labelStrings,
      projectApiToken: projectApiToken,
      projectShaIdentifier: projectShaIdentifier,
    );

    final keyedStrings = humanFriendlyResponse.humanFriendlyArbKeys;
    final newHardcodedStringKeyCache =
        humanFriendlyResponse.newHardcodedStringKeyCache;

    if (generateLogs) {
      print('Created ${keyedStrings.length} ARB keys');
      await _saveStringListData(
        keyedStrings.map((k) => k.toMap()).toList(),
        // keyedStrings.map((k, v) => MapEntry(k, v.toMap())),
        'step_3.json',
      );
    }

    // Garantee is same lenght
    if (keyedStrings.length != labelStrings.length) {
      throw Exception(
        'Mismatch in number of strings after creating ARB keys.'
        'Expected ${labelStrings.length}, got ${keyedStrings.length}.\nThis is likely a bug in our side, please contact support',
      );
    }

    // 4. Map strings hierarchy
    if (generateLogs) print('Mapping string hierarchy...');
    final labelEntities = _mapStringsHierarchyUsecase(strings: keyedStrings);
    if (generateLogs) {
      print('Created hierarchy with ${labelEntities.length} root labels');
      await _saveStringListData(
        labelEntities.map((e) => e.toJson()).toList(),
        'step_4.json',
      );
    }

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

    if (generateLogs) {
      print(
        'Mapped ${babelLabels.length} Babel labels to ${allHardcodedStrings.length} files',
      );
    }

    // Sort the entries by startIndex. The first should be the biggest index,
    // the last should be the smallest index
    allHardcodedStrings.forEach((key, value) {
      value.sort((a, b) => b.fileStartIndex.compareTo(a.fileStartIndex));
    });

    if (generateLogs) {
      await _saveStringListData(
        babelLabels.map((label) => label.toJson()).toList(),
        'step_5.json',
      );
    }

    return ExtractorResponse(
      allHardcodedStrings: allHardcodedStrings.entries.toList(),
      newHardcodedStringKeyCache: newHardcodedStringKeyCache,
    );
  }

  /// Saves data to a JSON file
  Future<void> _saveStringListData(
    List<Map<String, dynamic>> data,
    String fileName,
  ) async {
    final outFile = File(p.join(Directory.current.path, fileName));
    await outFile.writeAsString(JsonEncoder.withIndent('  ').convert(data));
  }

  /// Saves data to a JSON file
  Future<void> _saveStringData(
    Map<String, dynamic> data,
    String fileName,
  ) async {
    final outFile = File(p.join(Directory.current.path, fileName));
    await outFile.writeAsString(JsonEncoder.withIndent('  ').convert(data));
  }
}

class ExtractorResponse {
  final Iterable<MapEntry<FilePath, List<BabelLabelEntityRootLabel>>>
  allHardcodedStrings;
  final Map<HardCodedString, TranslationKey> newHardcodedStringKeyCache;

  const ExtractorResponse({
    required this.allHardcodedStrings,
    required this.newHardcodedStringKeyCache,
  });
}
