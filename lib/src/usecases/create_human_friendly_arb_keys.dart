// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:io';

import 'package:collection/collection.dart';
import 'package:console_bars/console_bars.dart';
import 'package:gobabel_string_extractor/src/core/extensions/string_extension.dart';
import 'package:path/path.dart' as p;

import 'package:gobabel_client/gobabel_client.dart';
import 'package:gobabel_core/gobabel_core.dart';
import 'package:gobabel_string_extractor/src/core/cripto.dart';
import 'package:gobabel_string_extractor/src/entities/hardcoded_string_entity.dart';

abstract class ICreateHumanFriendlyArbKeysUsecase {
  /// Creates human-friendly ARB keys for a list of hardcoded strings.
  ///
  /// The key will be based on the content of the string.
  ///
  /// The keys should:
  /// 1. Be descriptive but concise (not too long)
  /// 2. Use camelCase format (first word lowercase, subsequent words capitalized, no spaces or underscores)
  /// 3. Accurately represent the content's meaning
  /// 4. Follow best practices for i18n key naming
  Future<HumanFriendlyResponse> call({
    required List<HardcodedStringEntity> strings,
    required String projectApiToken,
    required BigInt projectShaIdentifier,
    required Map<HardCodedString, TranslationKey>
    projectHardcodedStringKeyCache,
  });
}

/// Implementation of [ICreateHumanFriendlyArbKeysUsecase] that uses the Serverpod server
/// with AI to generate human-friendly ARB keys.
class CreateHumanFriendlyArbKeysWithAiOnServerUsecaseImpl
    implements ICreateHumanFriendlyArbKeysUsecase {
  final GaranteeUniquenessOfArbKeysUsecase _garanteeUniquenessOfArbKeysUsecase;
  final Client _client;

  /// Creates a new instance of [CreateHumanFriendlyArbKeysWithAiOnServerUsecaseImpl].
  ///
  /// Requires [projectApiToken] and [projectShaIdentifier] for authenticating
  /// with the server, and a [client] for making the API calls.
  const CreateHumanFriendlyArbKeysWithAiOnServerUsecaseImpl({
    required GaranteeUniquenessOfArbKeysUsecase
    garanteeUniquenessOfArbKeysUsecase,
    required Client client,
  }) : _client = client,
       _garanteeUniquenessOfArbKeysUsecase = garanteeUniquenessOfArbKeysUsecase;

  @override
  Future<HumanFriendlyResponse> call({
    required List<HardcodedStringEntity> strings,
    required String projectApiToken,
    required BigInt projectShaIdentifier,
    required Map<HardCodedString, TranslationKey>
    projectHardcodedStringKeyCache,
  }) async {
    if (strings.isEmpty) {
      return HumanFriendlyResponse(
        newHardcodedStringKeyCache: {},
        humanFriendlyArbKeys: [],
      );
    }

    final List<HumanFriendlyArbKeyResponse> keyMap = [];

    // Separate strings that are already in cache vs need to be generated
    final List<HardcodedStringEntity> stringsNeedingGeneration = [];

    for (final string in strings) {
      final cachedKey =
          projectHardcodedStringKeyCache[string.value.trimHardcodedString];
      if (cachedKey != null) {
        // Use cached key
        keyMap.add(HumanFriendlyArbKeyResponse(key: cachedKey, value: string));
      } else {
        // Need to generate key
        stringsNeedingGeneration.add(string);
      }
    }

    final Map<HardCodedString, TranslationKey> newHardcodedStringKeyCache = {};

    // Only generate keys for strings not in cache
    if (stringsNeedingGeneration.isNotEmpty) {
      // Create a map of SHA1 keys to string values for strings needing generation
      final Map<L10nValue, Sha1> shaMap = {};
      final Map<Sha1, L10nValue> extractedStrings = {};
      for (final HardcodedStringEntity string in stringsNeedingGeneration) {
        final key = generateSha1(string.value);
        extractedStrings[key] = string.value;
        shaMap[string.value] = key;
      }

      // Split the strings into manageable groups for API requests
      final groups = splitIntoManageableGroupsForApi(extractedStrings);

      // Process each group and combine results
      final Map<String, String> combinedResults = {};

      final bool isSmallAmountOfStrings = groups.length <= 2;

      final FillingBar? p = isSmallAmountOfStrings
          ? null
          : FillingBar(
              desc: 'Replacing hardcoded strings...',
              total: groups.length,
              time: true,
              percentage: true,
            );

      Future<void> function() async {
        for (final group in groups) {
          p?.increment();
          // Call the server endpoint to generate ARB keys
          final result = await _client.publicArbHelpers.createArbKeyNames(
            projectApiToken: projectApiToken,
            projectShaIdentifier: projectShaIdentifier,
            translationContents: group,
          );

          // Add results to the combined results map
          combinedResults.addAll(
            result.map((key, value) {
              return MapEntry(key.trimHardcodedString, value);
            }),
          );
        }
      }

      if (isSmallAmountOfStrings) {
        await runWithSpinner(
          successMessage: 'Created human-friendly ARB keys',
          message: 'Creating human-friendly ARB keys...',
          function,
        );
      } else {
        await function();
      }

      await _saveStringData(combinedResults, 'combinedresults.json');

      // Process the generated keys
      for (final string in stringsNeedingGeneration) {
        final sha1 = shaMap[string.value]!;
        final key = combinedResults[sha1]!;

        // Ensure the key is unique and follows the camelCase format
        final camelCaseKey = _garanteeUniquenessOfArbKeysUsecase(
          key.toCamelCaseOrEmpty,
        );
        // final camelCaseKey = key.toCamelCaseOrEmpty;
        if (camelCaseKey.isEmpty) {
          throw Exception(
            'Generated key for "${string.value}" is empty. Please check the string content.',
          );
        }
        keyMap.add(
          HumanFriendlyArbKeyResponse(key: camelCaseKey, value: string),
        );
        newHardcodedStringKeyCache[string.value] = camelCaseKey;
      }
    }

    return HumanFriendlyResponse(
      newHardcodedStringKeyCache: newHardcodedStringKeyCache,
      humanFriendlyArbKeys: keyMap,
    );
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

extension StringCamelCaseExtension on String {
  /// Transforms the string to camelCase.
  ///
  /// - Trims leading/trailing whitespace.
  /// - Splits by spaces, hyphens, or underscores.
  /// - The first word is converted to lowercase.
  /// - Subsequent words have their first letter capitalized and the rest lowercased.
  ///
  /// If the original string (after trimming) or the resulting camelCase string
  /// is empty, it returns "emptyVariable".
  String get toCamelCaseOrEmpty {
    if (CaseIdentifyRegex.isCamelCase(trim())) {
      return this;
    }
    // 1. Check if the original string is "empty" (after trimming)
    final trimmedOriginal = trim();
    if (trimmedOriginal.isEmpty) {
      return "emptyVariable";
    }

    // 2. Split into words using common delimiters (space, hyphen, underscore)
    //    The regex r'[\s_-]+' matches one or more whitespace characters, underscores, or hyphens.
    //    Filter out empty strings that might result from multiple delimiters together (e.g., "hello--world").
    List<String> words = trimmedOriginal
        .split(RegExp(r'[\s_-]+'))
        .where((part) => part.isNotEmpty)
        .toList();

    // 3. If no valid words are found after splitting (e.g., input was "---" or "_ _")
    //    This means the potential camelCase result would be empty.
    if (words.isEmpty) {
      return "emptyVariable";
    }

    // 4. Construct the camelCase string
    //    The first word is all lowercase.
    String camelCaseResult = words.first.toLowerCase();

    //    For subsequent words, capitalize the first letter and lowercase the rest.
    for (int i = 1; i < words.length; i++) {
      String word = words[i];
      // This check is technically redundant due to the .where((part) => part.isNotEmpty) above,
      // but good for clarity if logic changes.
      if (word.isNotEmpty) {
        camelCaseResult +=
            word[0].toUpperCase() + word.substring(1).toLowerCase();
      }
    }

    // 5. Final check on the result (though `words.isEmpty` should cover this)
    //    This ensures that if somehow the camelCaseResult ended up empty (highly unlikely
    //    if `words` was not empty), it still returns "emptyVariable".
    if (camelCaseResult.isEmpty) {
      return "emptyVariable";
    }

    return camelCaseResult;
  }
}

class HumanFriendlyArbKeyResponse {
  final TranslationKey key;
  final HardcodedStringEntity value;

  const HumanFriendlyArbKeyResponse({required this.key, required this.value});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'key': key, 'value': value.toMap()};
  }

  String toJson() => json.encode(toMap());
}

class HumanFriendlyResponse {
  final Map<HardCodedString, TranslationKey> newHardcodedStringKeyCache;
  final List<HumanFriendlyArbKeyResponse> humanFriendlyArbKeys;
  const HumanFriendlyResponse({
    required this.newHardcodedStringKeyCache,
    required this.humanFriendlyArbKeys,
  });

  @override
  bool operator ==(covariant HumanFriendlyResponse other) {
    if (identical(this, other)) return true;
    final collectionEquals = const DeepCollectionEquality().equals;

    return collectionEquals(
          other.newHardcodedStringKeyCache,
          newHardcodedStringKeyCache,
        ) &&
        collectionEquals(other.humanFriendlyArbKeys, humanFriendlyArbKeys);
  }

  @override
  int get hashCode =>
      newHardcodedStringKeyCache.hashCode ^ humanFriendlyArbKeys.hashCode;
}
