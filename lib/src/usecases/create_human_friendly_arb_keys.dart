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
  });
}

/// Implementation of [ICreateHumanFriendlyArbKeysUsecase] that uses the Serverpod server
/// with AI to generate human-friendly ARB keys.
class CreateHumanFriendlyArbKeysWithAiOnServerUsecaseImpl
    implements ICreateHumanFriendlyArbKeysUsecase {
  final String projectApiToken;
  final BigInt projectShaIdentifier;
  final Client _client;

  /// Creates a new instance of [CreateHumanFriendlyArbKeysWithAiOnServerUsecaseImpl].
  ///
  /// Requires [projectApiToken] and [projectShaIdentifier] for authenticating
  /// with the server, and a [client] for making the API calls.
  CreateHumanFriendlyArbKeysWithAiOnServerUsecaseImpl({
    required this.projectApiToken,
    required this.projectShaIdentifier,
    required Client client,
  }) : _client = client;

  @override
  Future<Map<TranslationKey, HardcodedStringEntity>> call({
    required List<HardcodedStringEntity> strings,
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
      combinedResults.addAll(result);
    }

    // Map the combined server response back to the required format
    final Map<TranslationKey, HardcodedStringEntity> keyMap = {};
    for (final string in strings) {
      final sha1Key = generateSha1(string.value);
      if (combinedResults.containsKey(sha1Key)) {
        final arbKey = combinedResults[sha1Key]!;
        keyMap[arbKey] = string;
      }
    }

    return keyMap;
  }
}
