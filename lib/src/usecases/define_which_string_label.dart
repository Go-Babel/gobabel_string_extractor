import 'package:gobabel_string_extractor/src/core/extensions/string_extension.dart';
import 'package:gobabel_string_extractor/src/entities/hardcoded_string_entity.dart';
import 'package:gobabel_client/gobabel_client.dart';
import 'package:gobabel_string_extractor/src/core/cripto.dart';
import 'package:gobabel_string_extractor/src/core/api_request_splitter.dart';

abstract class IDefineWhichStringLabelUsecase {
  /// Delete all [HardcodedStringEntity]'s that are not labels.
  ///
  /// We wan't to ignore hardcoded strings that are dart code, like toString() method outputs, etc.
  /// We wan't only the strings that are user-facing messages, labels, and descriptions (natural language content intended for user display).
  Future<List<HardcodedStringEntity>> call({
    required List<HardcodedStringEntity> strings,
    required String projectApiToken,
    required BigInt projectShaIdentifier,
  });
}

/// Implementation of [IDefineWhichStringLabelUsecase] that uses the Serverpod server
/// with AI to determine which strings are displayable labels.
class DefineWhichStringLabelWithAiOnServerUsecaseImpl
    implements IDefineWhichStringLabelUsecase {
  final Client _client;

  /// Creates a new instance of [DefineWhichStringLabelWithAiOnServerUsecaseImpl].
  ///
  /// Requires [projectApiToken] and [projectShaIdentifier] for authenticating
  /// with the server, and an optional [client] for making the API calls.
  const DefineWhichStringLabelWithAiOnServerUsecaseImpl({
    required Client client,
  }) : _client = client;

  @override
  Future<List<HardcodedStringEntity>> call({
    required List<HardcodedStringEntity> strings,
    required String projectApiToken,
    required BigInt projectShaIdentifier,
  }) async {
    if (strings.isEmpty) return [];

    // Create a map of SHA1 keys to string values
    final Map<String, String> extractedStrings = {};
    for (final string in strings) {
      final key = generateSha1(string.value);
      extractedStrings[key] = string.value.trimHardcodedString;
    }

    // Process each group and combine results
    final Map<String, bool> combinedResults = {};

    final groups = splitIntoManageableGroupsForApi(extractedStrings);
    for (final group in groups) {
      // Call the server endpoint to analyze if strings are displayable labels
      final result = await _client.publicArbHelpers
          .analyseIfStringIsADisplayableLabel(
            projectApiToken: projectApiToken,
            projectShaIdentifier: projectShaIdentifier,
            extractedStrings: group,
          );

      // Add results to the combined results map
      combinedResults.addAll(result);
    }

    // Filter the strings based on the combined server responses
    return strings.where((string) {
      // Check if the string value exists in the result map and is marked as true
      return combinedResults[string.value] == true;
    }).toList();
  }
}
