import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gobabel_core/gobabel_core.dart';
import 'package:gobabel_string_extractor/src/entities/hardcoded_string_entity.dart';
import 'package:gobabel_client/gobabel_client.dart';
import 'package:gobabel_string_extractor/src/core/cripto.dart';
import 'package:console_bars/console_bars.dart';

abstract class IDefineWhichStringAreUserFriendlyLabelUsecase {
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

/// Implementation of [IDefineWhichStringAreUserFriendlyLabelUsecase] that uses the Serverpod server
/// with AI to determine which strings are displayable labels.
class DefineWhichStringLabelWithAiOnServerUsecaseImpl
    implements IDefineWhichStringAreUserFriendlyLabelUsecase {
  final Client _client;

  /// Creates a new instance of [DefineWhichStringLabelWithAiOnServerUsecaseImpl].
  ///
  /// Requires [projectApiToken] and [projectShaIdentifier] for authenticating
  /// with the server, and an optional [client] for making the API calls.
  DefineWhichStringLabelWithAiOnServerUsecaseImpl({required Client client})
    : _client = client;

  @visibleForTesting
  bool shouldAutomaticallyBeConsideredAValidString(String value) {
    final RegExp namePattern = RegExp(r'^[A-Z][a-z]+$');
    return namePattern.hasMatch(value);
  }

  @override
  Future<List<HardcodedStringEntity>> call({
    required List<HardcodedStringEntity> strings,
    required String projectApiToken,
    required BigInt projectShaIdentifier,
  }) async {
    if (strings.isEmpty) return [];

    // Separate strings that are automatically valid from those needing API validation
    final List<HardcodedStringEntity> automaticallyValidStrings = [];
    final List<HardcodedStringEntity> stringsNeedingValidation = [];

    for (final string in strings) {
      if (shouldAutomaticallyBeConsideredAValidString(
        string.value.trimHardcodedString,
      )) {
        automaticallyValidStrings.add(string);
      } else {
        stringsNeedingValidation.add(string);
      }
    }

    // If no strings need API validation, return the automatically valid ones
    if (stringsNeedingValidation.isEmpty) {
      return automaticallyValidStrings;
    }

    // Create a map of SHA1 keys to string values for API validation
    final Map<L10nValue, Sha1> shaMap = {};
    final Map<Sha1, L10nValue> extractedStrings = {};
    for (final string in stringsNeedingValidation) {
      final valueSha1 = generateSha1(string.value);
      extractedStrings[valueSha1] = string.value.trimHardcodedString;
      shaMap[string.value] = valueSha1;
    }

    // Process each group and combine results
    final Map<String, bool> combinedResults = {};

    final groups = splitIntoManageableGroupsForApi(extractedStrings);

    final bool isSmallAmountOfStrings = groups.length <= 2;

    final FillingBar? p = isSmallAmountOfStrings
        ? null
        : FillingBar(
            desc: 'Analysing strings...',
            total: groups.length,
            time: true,
            percentage: true,
          );

    Future<void> function() async {
      for (final group in groups) {
        p?.increment();
        final result = await _client.publicArbHelpers
            .analyseIfStringIsADisplayableLabel(
              projectApiToken: projectApiToken,
              projectShaIdentifier: projectShaIdentifier,
              extractedStrings: group,
            );
        combinedResults.addAll(result);
      }
    }

    if (isSmallAmountOfStrings) {
      await runWithSpinner(
        successMessage: 'Finished analyzing strings',
        message:
            'Analyzing which hardcoded strings are user-facing messages, labels, and descriptions...',
        function,
      );
    } else {
      await function();
    }

    // Filter the strings that needed validation based on the server responses
    final List<HardcodedStringEntity> apiValidatedStrings =
        stringsNeedingValidation.where((string) {
          final sha1 = shaMap[string.value]!;
          return combinedResults[sha1]!;
        }).toList();

    // Combine automatically valid strings with API-validated strings
    return [...automaticallyValidStrings, ...apiValidatedStrings];
  }
}
