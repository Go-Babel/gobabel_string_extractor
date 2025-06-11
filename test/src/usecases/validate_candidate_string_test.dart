import 'package:gobabel_core/gobabel_core.dart';
import 'package:gobabel_string_extractor/src/usecases/validate_candidate_string.dart';
import 'package:test/test.dart';

final List<String> _nonImportCaseTest = [
  'this.is.dot.case',
  'This-Is-Header-Case',
  'This.Is.Pascal.Dot.Case',
  'ThisIsPascalCase',
  'this-is-param-case',
  'this_is_snake_case',
  'this/is/path/case.dart',
  'thisIsCamelCase',
  'thisisatest',
  'this is a test with spaces',
  'this is a test with special characters !@#\$%^&*()',
];

final List<String> _importCaseTest = [
  'dart:async',
  'dart:convert',
  'dart:io',
  'dart:isolate',
  'package:collection/collection.dart',
  'package:dartz/dartz.dart',
  'package:player_source_models/extensions/datetime.dart',
  'package:dsf_commum_data_source/dsf_commum_data_source.dart',
  'package:enchanted_collection/enchanted_collection.dart',
  'package:flutter/foundation.dart',
  'package:player_source_models/extensions/either.dart',
  'package:player_source_models/extensions/string.dart',
  'package:player_source_models/models/detailed_position.dart',
  'package:player_source_models/models/e_country.dart',
  'package:player_source_models/models/e_level.dart',
  'package:player_source_models/models/e_status.dart',
  'package:player_source_models/models/player_season_average.dart',
  'package:player_source_models/models/playing_style.dart',
  'package:player_source_models/models/simplified_position.dart',
  'package:player_source_models/models/spreedsheet/spreadsheet_model.dart',
  'package:player_source_models/models/spreedsheet/wyscout_responses/career_stat.dart',
  'package:player_source_models/models/spreedsheet/wyscout_responses/championship_stat.dart',
  'package:player_source_models/models/spreedsheet/wyscout_responses/in_fields_stat.dart',
  'package:player_source_models/models/spreedsheet/wyscout_responses/player_advanced_stats.dart',
  'package:player_source_models/models/spreedsheet/wyscout_responses/player_contact.dart',
  'package:player_source_models/models/spreedsheet/wyscout_responses/player_detail.dart',
  'package:player_source_models/models/spreedsheet/wyscout_responses/player_market_situation.dart',
  'package:player_source_models/models/spreedsheet/wyscout_responses/remote_config.dart',
  'package:player_source_models/models/spreedsheet/wyscout_responses/team_player_avarage_stats.dart',
  'package:player_source_models/models/spreedsheet/wyscout_responses/transfermarkt_data.dart',
  'package:player_source_models/models/spreedsheet/wyscout_responses/wyscout_data.dart',
  'package:uuid/uuid.dart',
];

void main() {
  final ValidateCandidateStringUsecase validateCandidateStringUsecase =
      ValidateCandidateStringUsecase();

  group('Urls', () {
    test('Should not pass urls', () {
      final validUrls = [
        // Invalid URLs
        'http://-example.com', // label starts with hyphen
        'example.com-', // label ends with hyphen
        'example.c', // TLD only 1 character
        '192.168.0.1', // IP address, not allowed
        'ftp://example.com', // unsupported scheme
        '://example.com', // malformed scheme
        'http//example.com', // missing colon
        'https:/example.com', // malformed scheme
        '', // empty string
        '.example.com', // label starts with dot
        'example.com.', // trailing dot
        'example.com#', // fragment without value
        'example.com?', // query without parameters
        '/example.com', // path-only, no domain
        'example.com',
        'www.example.com',
        'sub-domain.example.co.uk',
        'http://example.com',
        'https://my-site.org/path/to/page?query=123#anchor',
        'example.com:8080/path?foo=bar',
        'EXAMPLE.COM',
        'https://example.com/',
        'example.co',
        'a-b.example-domain.io/path123',
      ];

      for (var potentialUrl in validUrls) {
        // final result = validateCandidateStringUsecase(potentialUrl);
        final result = validateCandidateStringUsecase(content: potentialUrl);
        if (result == true) {
          print('Test FAILED for "$potentialUrl": expected false, got $result');
        }
        expect(result, isFalse);
      }
    });

    test('Should not pass urls', () {
      // A comprehensive set of test cases to validate the URL regex.
      final tests = <String, bool>{
        // Valid URLs
        'example.com': true,
        'www.example.com': true,
        'sub-domain.example.co.uk': true,
        'http://example.com': true,
        'https://my-site.org/path/to/page?query=123#anchor': true,
        'example.com:8080/path?foo=bar': true,
        'EXAMPLE.COM': true, // case-insensitive
        'https://example.com/': true,
        'example.co': true,
        'a-b.example-domain.io/path123': true,
      };

      // Execute tests
      tests.forEach((input, expected) {
        final result = !validateCandidateStringUsecase(content: input);
        if (result != expected) {
          print('Test FAILED for "$input": expected $expected, got $result');
        } else {
          // print('Test passed for "$input".');
        }
        assert(result == expected);
      });
      // final result = validateCandidateStringUsecase.call(
      //   content: r'https://github.com/$owner/$repo/commit/$commitSha',
      //
      // );
      // expect(result, isFalse);
    });
  });
  group('Path case', () {
    test('PathCase should not pass (without initial bar)', () {
      final result = validateCandidateStringUsecase.call(
        content: 'this/is/path/case.dart',
      );
      expect(result, isFalse);
    });

    test('PathCase should not pass (with initial bar)', () {
      final result = validateCandidateStringUsecase.call(
        content: '/this/is/path/case.dart',
      );
      expect(result, isFalse);
    });

    test('Name path should pass (with initial bar)', () {
      final result = validateCandidateStringUsecase.call(content: 'Login');
      expect(result, isTrue);
    });

    test('Should not accept GoRouter path 1', () {
      final result = validateCandidateStringUsecase(content: '/splash');

      expect(result, isFalse);
    });
    test('Should not accept GoRouter path 2', () {
      final result = validateCandidateStringUsecase(content: '/splash.dart');

      expect(result, isFalse);
    });
    test('Should not accept GoRouter path 3', () {
      final result = validateCandidateStringUsecase(content: '/splash.dart/');

      expect(result, isFalse);
    });
  });

  group('Text Format Cases Tests', () {
    test('Import case shoudl not pass', () {
      final List<bool> negativeResults = _nonImportCaseTest
          .map(
            (String importCase) => CaseIdentifyRegex.isImportCase(importCase),
          )
          .toList();

      final List<bool> positiveResults = _importCaseTest
          .map(
            (String importCase) => CaseIdentifyRegex.isImportCase(importCase),
          )
          .toList();

      final List<bool> validateCandidateStringPositiveResults = _importCaseTest
          .map(
            (String importCase) =>
                validateCandidateStringUsecase.call(content: importCase),
          )
          .toList();

      expect(
        negativeResults,
        equals(List.generate(negativeResults.length, (_) => false)),
      );
      expect(
        positiveResults,
        equals(List.generate(positiveResults.length, (_) => true)),
      );
      expect(
        validateCandidateStringPositiveResults,
        equals(
          List.generate(
            validateCandidateStringPositiveResults.length,
            (_) => false,
          ),
        ),
      );
    });

    test('DotCase should not pass', () {
      final result = validateCandidateStringUsecase.call(
        content: 'this.is.dot.case',
      );
      expect(result, isFalse);
    });

    test('HeaderCase should not pass', () {
      final result = validateCandidateStringUsecase.call(
        content: 'This-Is-Header-Case',
      );
      expect(result, isFalse);
    });

    test('PascalDotCase should not pass', () {
      final result = validateCandidateStringUsecase.call(
        content: 'This.Is.Pascal.Dot.Case',
      );
      expect(result, isFalse);
    });

    test('PascalCase should not pass', () {
      final result = validateCandidateStringUsecase.call(
        content: 'ThisIsPascalCase',
      );
      expect(result, isFalse);
    });

    test('ParamCase should not pass', () {
      final result = validateCandidateStringUsecase.call(
        content: 'this-is-param-case',
      );
      expect(result, isFalse);
    });

    test('SnakeCase should not pass', () {
      final result = validateCandidateStringUsecase.call(
        content: 'this_is_snake_case',
      );
      expect(result, isFalse);
    });

    test('CamelCase should not pass', () {
      final result = validateCandidateStringUsecase.call(
        content: 'thisIsCamelCase',
      );
      expect(result, isFalse);
    });
  });

  group('hasNoWords Tests', () {
    final hasNoWords = validateCandidateStringUsecase.hasNoWords;
    test('Empty string should return true', () {
      expect(hasNoWords(''), isTrue);
    });

    test('String with only spaces should return true', () {
      expect(hasNoWords('   '), isTrue);
    });

    test('String with special characters only should return true', () {
      expect(hasNoWords('!@#\$%^'), isTrue);
    });

    test('String with alphabets should return false', () {
      expect(hasNoWords('hello'), isFalse);
    });

    test('String with numbers should return false', () {
      expect(hasNoWords('123'), isFalse);
    });

    test('Mixed string with alphabets should return false', () {
      expect(hasNoWords('!@#hello'), isFalse);
    });

    test('Mixed string with numbers should return false', () {
      expect(hasNoWords('!!!123'), isFalse);
    });

    test('String with only whitespace characters should return true', () {
      expect(hasNoWords('\n\t\r'), isTrue);
    });

    test('String with emojis only should return true', () {
      expect(hasNoWords('😊🚀'), isTrue);
    });

    test('String with spaces and special characters should return true', () {
      expect(hasNoWords(' ! @ # '), isTrue);
    });
  });
}
