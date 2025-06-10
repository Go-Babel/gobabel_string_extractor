import 'package:gobabel_core/gobabel_core.dart';

extension StringExtension on String {
  /// Cleans the hardcoded string
  /// Example:
  /// - $userName
  /// - ${userName}
  ///
  /// Should return only "userName"
  String get cleanHardcoded {
    String cleaned = trimHardcodedString;

    if (cleaned.startsWith('\$')) {
      cleaned = cleaned.substring(1);
    }

    if (cleaned.startsWith('{') && cleaned.endsWith('}')) {
      return cleaned.substring(1, cleaned.length - 1);
    }

    return cleaned;
  }
}
