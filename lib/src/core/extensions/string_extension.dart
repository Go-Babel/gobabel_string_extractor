extension StringExtension on String {
  /*
  HardcodedString.value can be, for example:
  "Hello, $userName!"
  'Hello, $userName!'
  '''Hello, $userName!'''
  """Hello, $userName!"""

  Should return only raw Hello, $userName!
  */
  String get trimHardcodedString {
    if (startsWith('"') && endsWith('"')) {
      return substring(1, length - 1);
    }

    if (startsWith("'") && endsWith("'")) {
      return substring(1, length - 1);
    }

    if (startsWith("'''") && endsWith("'''")) {
      return substring(1, length - 1);
    }

    if (startsWith("\"") && endsWith("\"")) {
      return substring(1, length - 1);
    }

    return this;
  }

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
