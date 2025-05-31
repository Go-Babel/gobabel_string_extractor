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
}
