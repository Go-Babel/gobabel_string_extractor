import 'dart:convert';

import 'package:crypto/crypto.dart';

String generateSha1(String input) {
  var bytes = utf8.encode(input);
  var digest = sha1.convert(bytes);
  return digest.toString();
}
