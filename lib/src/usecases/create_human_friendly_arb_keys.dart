import 'package:gobabel_core/gobabel_core.dart';
import 'package:gobabel_string_extractor/src/entities/hardcoded_string_entity.dart';
import 'package:gobabel_client/gobabel_client.dart';
import 'package:gobabel_string_extractor/src/core/cripto.dart';
import 'package:gobabel_string_extractor/src/core/api_request_splitter.dart';

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
  Future<Map<TranslationKey, HardcodedStringEntity>> call({
    required List<HardcodedStringEntity> strings,
    required String projectApiToken,
    required BigInt projectShaIdentifier,
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
  Future<Map<TranslationKey, HardcodedStringEntity>> call({
    required List<HardcodedStringEntity> strings,
    required String projectApiToken,
    required BigInt projectShaIdentifier,
  }) async {
    if (strings.isEmpty) return {};

    // Create a map of SHA1 keys to string values
    final Map<String, String> extractedStrings = {};
    for (final string in strings) {
      final key = generateSha1(string.value);
      extractedStrings[key] = string.value;
    }

    // Split the strings into manageable groups for API requests
    final groups = splitIntoManageableGroupsForApi(extractedStrings);

    // Process each group and combine results
    final Map<String, String> combinedResults = {};

    for (final group in groups) {
      // Call the server endpoint to generate ARB keys
      final result = await _client.publicArbHelpers.createArbKeyNames(
        projectApiToken: projectApiToken,
        projectShaIdentifier: projectShaIdentifier,
        translationContents: group,
      );

      // Add results to the combined results map
      combinedResults.addAll(
        result.map((key, value) {
          return MapEntry(_garanteeUniquenessOfArbKeysUsecase(key), value);
        }),
      );
    }

    // Map the combined server response back to the required format
    final Map<TranslationKey, HardcodedStringEntity> keyMap = {};
    for (final string in strings) {
      final sha1Key = generateSha1(string.value);
      if (combinedResults.containsKey(sha1Key)) {
        final arbKey = combinedResults[sha1Key]!.toCamelCaseOrEmpty;
        keyMap[arbKey] = string;
      }
    }

    return keyMap;
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
