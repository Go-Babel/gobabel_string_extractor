// Will see if a string is a displayable text for the final user or if
// is just a configuration string. Such as a key of a map, a fromJson string,
// a toString() string, etc. Mainly, anything that is cammelCase.
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gobabel_core/gobabel_core.dart';

class ValidateCandidateStringUsecase {
  const ValidateCandidateStringUsecase();

  /// Returns true if the string is a displayable text for the final user.
  bool call({required String content}) {
    return hasNoWords(content) == false &&
        CaseIdentifyRegex.isAnyCase(content) == false &&
        isUrl(content) == false;
  }

  @visibleForTesting
  bool hasNoWords(String input) {
    return RegExp(r'^[^a-zA-Z0-9]+$').hasMatch(input) || input.isEmpty;
  }

  @visibleForTesting
  bool isUrl(String source) {
    const pattern =
        r'^(?:[a-zA-Z-\/\\:.]{1,7}?:?\/?\/?)?-?(?:[A-Za-z0-9](?:[A-Za-z0-9-]*[A-Za-z0-9])?\.)+[A-Za-z]{1,}(?::\d{1,5})?(?:\/[^\s#?]*)?(?:\?[^#\s]*)?(?:#[^\s]*)?[-\/\\:.]*$';
    // const pattern = r'^(?:https?://)?'            // optional http or https scheme
    //                      r'(?:[A-Za-z0-9]'        // domain labels: start with alphanumeric
    //                      r'(?:[A-Za-z0-9-]*[A-Za-z0-9])?\.)+' // optional hyphens inside, then dot
    //                      r'[A-Za-z]{2,}'          // top-level domain (min. 2 letters)
    //                      r'(?::\d{1,5})?'        // optional port
    //                      r'(?:/[^\s#?]*)?'       // optional path
    //                      r'(?:\?[^#\s]*)?'      // optional query
    //                      r'(?:#[^\s]*)?'         // optional fragment
    //                      r'\$';                   // end of string

    final regex = RegExp(pattern, caseSensitive: false);
    final result = regex.hasMatch(source);
    return result;
  }
}
