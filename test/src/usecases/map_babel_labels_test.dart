import 'dart:convert';
import 'dart:io';
import 'package:gobabel_string_extractor/gobabel_labels_extractor.dart';
import 'package:gobabel_string_extractor/src/entities/labels_entity.dart';
import 'package:path/path.dart' as p;
import 'package:test/test.dart';
import 'package:gobabel_core/gobabel_core.dart';
import 'package:gobabel_string_extractor/src/usecases/map_babel_labels.dart';

void main() {
  test('Map babel labels hierarchy ...', () async {
    final babelMapper = MapBabelLabelsUsecaseImpl(
      inferDeclaration: InferDeclarationFunctionByArbValueUsecase(),
    );

    final payload = (jsonDecode(testString) as List)
        .cast<Map<String, dynamic>>()
        .map(LabelsEntityRootLabel.fromJson)
        .toList();

    final babelLabels = babelMapper(strings: payload);

    await _saveStringListData(
      babelLabels
          .where(
            // Only the ones with children
            (label) => label.children.isNotEmpty,
          )
          .map((label) => label.toJson())
          .toList(),
      'map_labels_with_children.json',
    );
    await _saveStringListData(
      babelLabels
          .where(
            // Only the ones without children
            (label) => label.children.isEmpty,
          )
          .map((label) => label.toJson())
          .toList(),
      'map_labels_without_children.json',
    );

    final dynamicValues = babelLabels
        .where(
          // Only the ones with children
          (label) => label.children.isNotEmpty,
        )
        .toList()
        .whereType<BabelLabelEntityRootLabel>()
        .map((e) => e.l10nValue);

    final outFile = File(p.join(Directory.current.path, 'map_l10NValue.txt'));
    await outFile.writeAsString(dynamicValues.join('\n'));
  });
}

/// Saves data to a JSON file
Future<void> _saveStringListData(
  List<Map<String, dynamic>> data,
  String fileName,
) async {
  final outFile = File(p.join(Directory.current.path, fileName));
  await outFile.writeAsString(JsonEncoder.withIndent('  ').convert(data));
}

/// Saves data to a JSON file
Future<void> _saveStringData(Map<String, dynamic> data, String fileName) async {
  final outFile = File(p.join(Directory.current.path, fileName));
  await outFile.writeAsString(JsonEncoder.withIndent('  ').convert(data));
}

final String testString = r'''[
  {
    "l10nKey": "unableToParseOriginUrl",
    "hardcodedString": "'⚠️ Unable to parse origin URL.'",
    "fileStartIndex": 216,
    "fileEndIndex": 248,
    "filePath": "/Users/igormidev/gobabel/go_babel_app/gobabel_flutter/lib/core/utils/git_commit_url.dart",
    "children": [],
    "runtimeType": "rootLabel"
  },
  {
    "l10nKey": "invalidGitUrlFormat",
    "hardcodedString": "'⚠️ Invalid Git URL format.'",
    "fileStartIndex": 423,
    "fileEndIndex": 451,
    "filePath": "/Users/igormidev/gobabel/go_babel_app/gobabel_flutter/lib/core/utils/git_commit_url.dart",
    "children": [],
    "runtimeType": "rootLabel"
  },
  {
    "l10nKey": "errorGettingLabels",
    "hardcodedString": "'Error getting labels'",
    "fileStartIndex": 2601,
    "fileEndIndex": 2623,
    "filePath": "/Users/igormidev/gobabel/go_babel_app/gobabel_flutter/lib/common_states/labels/labels_provider.dart",
    "children": [],
    "runtimeType": "rootLabel"
  },
  {
    "l10nKey": "internalErrorTryAgainLater",
    "hardcodedString": "'Seems to be a internal error.\\nPlease try again later. If '",
    "fileStartIndex": 2662,
    "fileEndIndex": 2722,
    "filePath": "/Users/igormidev/gobabel/go_babel_app/gobabel_flutter/lib/common_states/labels/labels_provider.dart",
    "children": [],
    "runtimeType": "rootLabel"
  },
  {
    "l10nKey": "problemPersistsContactUs",
    "hardcodedString": "'the problem persists, please contact us.'",
    "fileStartIndex": 2737,
    "fileEndIndex": 2779,
    "filePath": "/Users/igormidev/gobabel/go_babel_app/gobabel_flutter/lib/common_states/labels/labels_provider.dart",
    "children": [],
    "runtimeType": "rootLabel"
  },
  {
    "l10nKey": "logOut",
    "hardcodedString": "'Log out'",
    "fileStartIndex": 2059,
    "fileEndIndex": 2068,
    "filePath": "/Users/igormidev/gobabel/go_babel_app/gobabel_flutter/lib/common_states/dashboard/dashboard_index_provider.dart",
    "children": [],
    "runtimeType": "rootLabel"
  },
  {
    "l10nKey": "areYouSureYouWantToLogOut",
    "hardcodedString": "'Are you sure you want to log out?'",
    "fileStartIndex": 2083,
    "fileEndIndex": 2118,
    "filePath": "/Users/igormidev/gobabel/go_babel_app/gobabel_flutter/lib/common_states/dashboard/dashboard_index_provider.dart",
    "children": [],
    "runtimeType": "rootLabel"
  },
  {
    "l10nKey": "logOut",
    "hardcodedString": "'Log out'",
    "fileStartIndex": 2133,
    "fileEndIndex": 2142,
    "filePath": "/Users/igormidev/gobabel/go_babel_app/gobabel_flutter/lib/common_states/dashboard/dashboard_index_provider.dart",
    "children": [],
    "runtimeType": "rootLabel"
  },
  {
    "l10nKey": "cancel",
    "hardcodedString": "'Cancel'",
    "fileStartIndex": 2161,
    "fileEndIndex": 2169,
    "filePath": "/Users/igormidev/gobabel/go_babel_app/gobabel_flutter/lib/common_states/dashboard/dashboard_index_provider.dart",
    "children": [],
    "runtimeType": "rootLabel"
  },
  {
    "l10nKey": "logOut",
    "hardcodedString": "'Log out'",
    "fileStartIndex": 2472,
    "fileEndIndex": 2481,
    "filePath": "/Users/igormidev/gobabel/go_babel_app/gobabel_flutter/lib/common_states/dashboard/dashboard_index_provider.dart",
    "children": [],
    "runtimeType": "rootLabel"
  },
  {
    "l10nKey": "areYouSureYouWantToLogOut",
    "hardcodedString": "'Are you sure you want to log out?'",
    "fileStartIndex": 2496,
    "fileEndIndex": 2531,
    "filePath": "/Users/igormidev/gobabel/go_babel_app/gobabel_flutter/lib/common_states/dashboard/dashboard_index_provider.dart",
    "children": [],
    "runtimeType": "rootLabel"
  },
  {
    "l10nKey": "logOut",
    "hardcodedString": "'Log out'",
    "fileStartIndex": 2546,
    "fileEndIndex": 2555,
    "filePath": "/Users/igormidev/gobabel/go_babel_app/gobabel_flutter/lib/common_states/dashboard/dashboard_index_provider.dart",
    "children": [],
    "runtimeType": "rootLabel"
  },
  {
    "l10nKey": "cancel",
    "hardcodedString": "'Cancel'",
    "fileStartIndex": 2574,
    "fileEndIndex": 2582,
    "filePath": "/Users/igormidev/gobabel/go_babel_app/gobabel_flutter/lib/common_states/dashboard/dashboard_index_provider.dart",
    "children": [],
    "runtimeType": "rootLabel"
  },
  {
    "l10nKey": "onboardingFlowStateProviderProjectStateDataIsNull",
    "hardcodedString": "'onboardingFlowStateProvider: projectStateData is null and this should not happen.\\nstate: ${ref.read(projectProvider)}'",
    "fileStartIndex": 1082,
    "fileEndIndex": 1202,
    "filePath": "/Users/igormidev/gobabel/go_babel_app/gobabel_flutter/lib/common_states/dashboard/onboarding_flow_provider.dart",
    "children": [
      {
        "content": "${ref.read(projectProvider)}",
        "parentStartIndex": 91,
        "parentEndIndex": 119,
        "children": [],
        "runtimeType": "labelDynamicValue"
      }
    ],
    "runtimeType": "rootLabel"
  },
  {
    "l10nKey": "emailConfirmed",
    "hardcodedString": "'Email confirmed!'",
    "fileStartIndex": 2428,
    "fileEndIndex": 2446,
    "filePath": "/Users/igormidev/gobabel/go_babel_app/gobabel_flutter/lib/auth/ui/views/auth_view.dart",
    "children": [],
    "runtimeType": "rootLabel"
  },
  {
    "l10nKey": "canNowLogInWithEmailAndPassword",
    "hardcodedString": "'Now you can log in with your email and password.'",
    "fileStartIndex": 2463,
    "fileEndIndex": 2513,
    "filePath": "/Users/igormidev/gobabel/go_babel_app/gobabel_flutter/lib/auth/ui/views/auth_view.dart",
    "children": [],
    "runtimeType": "rootLabel"
  },
  {
    "l10nKey": "ok",
    "hardcodedString": "'OK'",
    "fileStartIndex": 2530,
    "fileEndIndex": 2534,
    "filePath": "/Users/igormidev/gobabel/go_babel_app/gobabel_flutter/lib/auth/ui/views/auth_view.dart",
    "children": [],
    "runtimeType": "rootLabel"
  },
  {
    "l10nKey": "welcome",
    "hardcodedString": "'Welcome'",
    "fileStartIndex": 4415,
    "fileEndIndex": 4424,
    "filePath": "/Users/igormidev/gobabel/go_babel_app/gobabel_flutter/lib/auth/ui/views/auth_view.dart",
    "children": [],
    "runtimeType": "rootLabel"
  },
  {
    "l10nKey": "login",
    "hardcodedString": "'Login'",
    "fileStartIndex": 7217,
    "fileEndIndex": 7224,
    "filePath": "/Users/igormidev/gobabel/go_babel_app/gobabel_flutter/lib/auth/ui/views/auth_view.dart",
    "children": [],
    "runtimeType": "rootLabel"
  },
  {
    "l10nKey": "signIn",
    "hardcodedString": "'Sign In'",
    "fileStartIndex": 7469,
    "fileEndIndex": 7478,
    "filePath": "/Users/igormidev/gobabel/go_babel_app/gobabel_flutter/lib/auth/ui/views/auth_view.dart",
    "children": [],
    "runtimeType": "rootLabel"
  },
  {
    "l10nKey": "passwordReset",
    "hardcodedString": "'Password Reset'",
    "fileStartIndex": 7784,
    "fileEndIndex": 7800,
    "filePath": "/Users/igormidev/gobabel/go_babel_app/gobabel_flutter/lib/auth/ui/views/auth_view.dart",
    "children": [],
    "runtimeType": "rootLabel"
  },
  {
    "l10nKey": "signUp",
    "hardcodedString": "'Sign Up'",
    "fileStartIndex": 778,
    "fileEndIndex": 787,
    "filePath": "/Users/igormidev/gobabel/go_babel_app/gobabel_flutter/lib/auth/ui/pages/sign_in_page.dart",
    "children": [],
    "runtimeType": "rootLabel"
  },
  {
    "l10nKey": "userNameOrCompanyName",
    "hardcodedString": "'User name (or company name)'",
    "fileStartIndex": 846,
    "fileEndIndex": 875,
    "filePath": "/Users/igormidev/gobabel/go_babel_app/gobabel_flutter/lib/auth/ui/pages/sign_in_page.dart",
    "children": [],
    "runtimeType": "rootLabel"
  },
  {
    "l10nKey": "userDisplayName",
    "hardcodedString": "'User display name. Typically the company name.'",
    "fileStartIndex": 898,
    "fileEndIndex": 946,
    "filePath": "/Users/igormidev/gobabel/go_babel_app/gobabel_flutter/lib/auth/ui/pages/sign_in_page.dart",
    "children": [],
    "runtimeType": "rootLabel"
  },
  {
    "l10nKey": "enterYourEmail",
    "hardcodedString": "'Enter your email'",
    "fileStartIndex": 1210,
    "fileEndIndex": 1228,
    "filePath": "/Users/igormidev/gobabel/go_babel_app/gobabel_flutter/lib/auth/ui/pages/sign_in_page.dart",
    "children": [],
    "runtimeType": "rootLabel"
  },
  {
    "l10nKey": "email",
    "hardcodedString": "'Email'",
    "fileStartIndex": 1251,
    "fileEndIndex": 1258,
    "filePath": "/Users/igormidev/gobabel/go_babel_app/gobabel_flutter/lib/auth/ui/pages/sign_in_page.dart",
    "children": [],
    "runtimeType": "rootLabel"
  },
  {
    "l10nKey": "enterYourPassword",
    "hardcodedString": "'Enter your password'",
    "fileStartIndex": 1567,
    "fileEndIndex": 1588,
    "filePath": "/Users/igormidev/gobabel/go_babel_app/gobabel_flutter/lib/auth/ui/pages/sign_in_page.dart",
    "children": [],
    "runtimeType": "rootLabel"
  },
  {
    "l10nKey": "password",
    "hardcodedString": "'Password'",
    "fileStartIndex": 1611,
    "fileEndIndex": 1621,
    "filePath": "/Users/igormidev/gobabel/go_babel_app/gobabel_flutter/lib/auth/ui/pages/sign_in_page.dart",
    "children": [],
    "runtimeType": "rootLabel"
  },
  {
    "l10nKey": "typeYourPasswordAgain",
    "hardcodedString": "'Type your password again'",
    "fileStartIndex": 1822,
    "fileEndIndex": 1848,
    "filePath": "/Users/igormidev/gobabel/go_babel_app/gobabel_flutter/lib/auth/ui/pages/sign_in_page.dart",
    "children": [],
    "runtimeType": "rootLabel"
  },
  {
    "l10nKey": "confirmPassword",
    "hardcodedString": "'Confirm password'",
    "fileStartIndex": 1871,
    "fileEndIndex": 1889,
    "filePath": "/Users/igormidev/gobabel/go_babel_app/gobabel_flutter/lib/auth/ui/pages/sign_in_page.dart",
    "children": [],
    "runtimeType": "rootLabel"
  },
  {
    "l10nKey": "confirmYourEmail",
    "hardcodedString": "'Confirm your email'",
    "fileStartIndex": 953,
    "fileEndIndex": 973,
    "filePath": "/Users/igormidev/gobabel/go_babel_app/gobabel_flutter/lib/auth/ui/pages/confirm_email_page.dart",
    "children": [],
    "runtimeType": "rootLabel"
  },
  {
    "l10nKey": "checkYourEmailForTheValidationCode",
    "hardcodedString": "'Check your email for the validation code'",
    "fileStartIndex": 1032,
    "fileEndIndex": 1074,
    "filePath": "/Users/igormidev/gobabel/go_babel_app/gobabel_flutter/lib/auth/ui/pages/confirm_email_page.dart",
    "children": [],
    "runtimeType": "rootLabel"
  },
  {
    "l10nKey": "validationCode",
    "hardcodedString": "'Validation code'",
    "fileStartIndex": 1097,
    "fileEndIndex": 1114,
    "filePath": "/Users/igormidev/gobabel/go_babel_app/gobabel_flutter/lib/auth/ui/pages/confirm_email_page.dart",
    "children": [],
    "runtimeType": "rootLabel"
  },
  {
    "l10nKey": "checkYourEmail",
    "hardcodedString": "'Check your <i><b>\"$email\"<b><i>'",
    "fileStartIndex": 1763,
    "fileEndIndex": 1796,
    "filePath": "/Users/igormidev/gobabel/go_babel_app/gobabel_flutter/lib/auth/ui/pages/confirm_email_page.dart",
    "children": [
      {
        "content": "$email",
        "parentStartIndex": 19,
        "parentEndIndex": 25,
        "children": [],
        "runtimeType": "labelDynamicValue"
      }
    ],
    "runtimeType": "rootLabel"
  },
  {
    "l10nKey": "sendVerificationCode",
    "hardcodedString": "'Send verification code'",
    "fileStartIndex": 722,
    "fileEndIndex": 746,
    "filePath": "/Users/igormidev/gobabel/go_babel_app/gobabel_flutter/lib/auth/ui/pages/password_reset_page.dart",
    "children": [],
    "runtimeType": "rootLabel"
  },
  {
    "l10nKey": "theEmailYouRegisteredWith",
    "hardcodedString": "'The email you registered with'",
    "fileStartIndex": 805,
    "fileEndIndex": 836,
    "filePath": "/Users/igormidev/gobabel/go_babel_app/gobabel_flutter/lib/auth/ui/pages/password_reset_page.dart",
    "children": [],
    "runtimeType": "rootLabel"
  },
  {
    "l10nKey": "email",
    "hardcodedString": "'Email'",
    "fileStartIndex": 859,
    "fileEndIndex": 866,
    "filePath": "/Users/igormidev/gobabel/go_babel_app/gobabel_flutter/lib/auth/ui/pages/password_reset_page.dart",
    "children": [],
    "runtimeType": "rootLabel"
  },
  {
    "l10nKey": "averificationcodewillbesenttoyouremail",
    "hardcodedString": "'A verification code will be sent to your email'",
    "fileStartIndex": 1184,
    "fileEndIndex": 1232,
    "filePath": "/Users/igormidev/gobabel/go_babel_app/gobabel_flutter/lib/auth/ui/pages/password_reset_page.dart",
    "children": [],
    "runtimeType": "rootLabel"
  },
  {
    "l10nKey": "logIn",
    "hardcodedString": "'Log In'",
    "fileStartIndex": 1080,
    "fileEndIndex": 1088,
    "filePath": "/Users/igormidev/gobabel/go_babel_app/gobabel_flutter/lib/auth/ui/pages/login_page.dart",
    "children": [],
    "runtimeType": "rootLabel"
  },
  {
    "l10nKey": "enterYourEmail",
    "hardcodedString": "'Enter your email'",
    "fileStartIndex": 1147,
    "fileEndIndex": 1165,
    "filePath": "/Users/igormidev/gobabel/go_babel_app/gobabel_flutter/lib/auth/ui/pages/login_page.dart",
    "children": [],
    "runtimeType": "rootLabel"
  },
  {
    "l10nKey": "email",
    "hardcodedString": "'Email'",
    "fileStartIndex": 1188,
    "fileEndIndex": 1195,
    "filePath": "/Users/igormidev/gobabel/go_babel_app/gobabel_flutter/lib/auth/ui/pages/login_page.dart",
    "children": [],
    "runtimeType": "rootLabel"
  },
  {
    "l10nKey": "enterYourPassword",
    "hardcodedString": "'Enter your password'",
    "fileStartIndex": 1504,
    "fileEndIndex": 1525,
    "filePath": "/Users/igormidev/gobabel/go_babel_app/gobabel_flutter/lib/auth/ui/pages/login_page.dart",
    "children": [],
    "runtimeType": "rootLabel"
  },
  {
    "l10nKey": "password",
    "hardcodedString": "'Password'",
    "fileStartIndex": 1548,
    "fileEndIndex": 1558,
    "filePath": "/Users/igormidev/gobabel/go_babel_app/gobabel_flutter/lib/auth/ui/pages/login_page.dart",
    "children": [],
    "runtimeType": "rootLabel"
  },
  {
    "l10nKey": "validationCode",
    "hardcodedString": "'Validation code'",
    "fileStartIndex": 952,
    "fileEndIndex": 969,
    "filePath": "/Users/igormidev/gobabel/go_babel_app/gobabel_flutter/lib/auth/ui/pages/password_reset_validate_code_page.dart",
    "children": [],
    "runtimeType": "rootLabel"
  },
  {
    "l10nKey": "newPassword",
    "hardcodedString": "'New password'",
    "fileStartIndex": 992,
    "fileEndIndex": 1006,
    "filePath": "/Users/igormidev/gobabel/go_babel_app/gobabel_flutter/lib/auth/ui/pages/password_reset_validate_code_page.dart",
    "children": [],
    "runtimeType": "rootLabel"
  },
  {
    "l10nKey": "defineYourNewPassword",
    "hardcodedString": "'Define your new password'",
    "fileStartIndex": 1118,
    "fileEndIndex": 1144,
    "filePath": "/Users/igormidev/gobabel/go_babel_app/gobabel_flutter/lib/auth/ui/pages/password_reset_validate_code_page.dart",
    "children": [],
    "runtimeType": "rootLabel"
  },
  {
    "l10nKey": "newPassword",
    "hardcodedString": "'New password'",
    "fileStartIndex": 1167,
    "fileEndIndex": 1181,
    "filePath": "/Users/igormidev/gobabel/go_babel_app/gobabel_flutter/lib/auth/ui/pages/password_reset_validate_code_page.dart",
    "children": [],
    "runtimeType": "rootLabel"
  },
  {
    "l10nKey": "typeAgainYourNewPassword",
    "hardcodedString": "'Type again your new password'",
    "fileStartIndex": 1356,
    "fileEndIndex": 1386,
    "filePath": "/Users/igormidev/gobabel/go_babel_app/gobabel_flutter/lib/auth/ui/pages/password_reset_validate_code_page.dart",
    "children": [],
    "runtimeType": "rootLabel"
  },
  {
    "l10nKey": "confirmPassword",
    "hardcodedString": "'Confirm password'",
    "fileStartIndex": 1409,
    "fileEndIndex": 1427,
    "filePath": "/Users/igormidev/gobabel/go_babel_app/gobabel_flutter/lib/auth/ui/pages/password_reset_validate_code_page.dart",
    "children": [],
    "runtimeType": "rootLabel"
  },
  {
    "l10nKey": "validateTheCodeSentToEmail",
    "hardcodedString": "'Validate the code sent to email'",
    "fileStartIndex": 1587,
    "fileEndIndex": 1620,
    "filePath": "/Users/igormidev/gobabel/go_babel_app/gobabel_flutter/lib/auth/ui/pages/password_reset_validate_code_page.dart",
    "children": [],
    "runtimeType": "rootLabel"
  },
  {
    "l10nKey": "passwordResetedWithSuccess",
    "hardcodedString": "'Password reseted with success!'",
    "fileStartIndex": 1738,
    "fileEndIndex": 1770,
    "filePath": "/Users/igormidev/gobabel/go_babel_app/gobabel_flutter/lib/auth/ui/pages/password_reset_validate_code_page.dart",
    "children": [],
    "runtimeType": "rootLabel"
  },
  {
    "l10nKey": "canNowLogInWithTheNewPassword",
    "hardcodedString": "'Now you can log in with the new password'",
    "fileStartIndex": 1791,
    "fileEndIndex": 1833,
    "filePath": "/Users/igormidev/gobabel/go_babel_app/gobabel_flutter/lib/auth/ui/pages/password_reset_validate_code_page.dart",
    "children": [],
    "runtimeType": "rootLabel"
  },
  {
    "l10nKey": "addContextToAllFilesInsideThisFolder",
    "hardcodedString": "'Add context to all files inside this folder'",
    "fileStartIndex": 5584,
    "fileEndIndex": 5629,
    "filePath": "/Users/igormidev/gobabel/go_babel_app/gobabel_flutter/lib/contexts_tab/ui/sections/folder_strucuture.dart",
    "children": [],
    "runtimeType": "rootLabel"
  },
  {
    "l10nKey": "tappedFolder",
    "hardcodedString": "'Tapped folder: ${folderInfo.fullPath}'",
    "fileStartIndex": 5830,
    "fileEndIndex": 5869,
    "filePath": "/Users/igormidev/gobabel/go_babel_app/gobabel_flutter/lib/contexts_tab/ui/sections/folder_strucuture.dart",
    "children": [
      {
        "content": "${folderInfo.fullPath}",
        "parentStartIndex": 16,
        "parentEndIndex": 38,
        "children": [],
        "runtimeType": "labelDynamicValue"
      }
    ],
    "runtimeType": "rootLabel"
  },
  {
    "l10nKey": "newLocalizedContextInput",
    "hardcodedString": "'New localized context input:'",
    "fileStartIndex": 1169,
    "fileEndIndex": 1199,
    "filePath": "/Users/igormidev/gobabel/go_babel_app/gobabel_flutter/lib/contexts_tab/ui/sections/localized_listage.dart",
    "children": [],
    "runtimeType": "rootLabel"
  },
  {
    "l10nKey": "otherAlreadyCreatedLocalizedContexts",
    "hardcodedString": "'Other already created localized contexts:'",
    "fileStartIndex": 1537,
    "fileEndIndex": 1580,
    "filePath": "/Users/igormidev/gobabel/go_babel_app/gobabel_flutter/lib/contexts_tab/ui/sections/localized_listage.dart",
    "children": [],
    "runtimeType": "rootLabel"
  },
  {
    "l10nKey": "youcreatedabrandnewproject",
    "hardcodedString": "'Uhull!\\nYou created a brand new project'",
    "fileStartIndex": 1406,
    "fileEndIndex": 1447,
    "filePath": "/Users/igormidev/gobabel/go_babel_app/gobabel_flutter/lib/contexts_tab/ui/sections/give_context_guide.dart",
    "children": [],
    "runtimeType": "rootLabel"
  }, 
  {
    "l10nKey": "gotIt",
    "hardcodedString": "'Got it!'",
    "fileStartIndex": 2886,
    "fileEndIndex": 2895,
    "filePath": "/Users/igormidev/gobabel/go_babel_app/gobabel_flutter/lib/contexts_tab/ui/sections/give_context_guide.dart",
    "children": [],
    "runtimeType": "rootLabel"
  }, 
  {
    "l10nKey": "mainAppContext",
    "hardcodedString": "'Main App Context'",
    "fileStartIndex": 6955,
    "fileEndIndex": 6973,
    "filePath": "/Users/igormidev/gobabel/go_babel_app/gobabel_flutter/lib/contexts_tab/ui/view/context_panel.dart",
    "children": [],
    "runtimeType": "rootLabel"
  },
  {
    "l10nKey": "typeHereTheMainAppContext",
    "hardcodedString": "'Type here the main app context...This is a more generic text about that you product is about. You can add context per feature as well, but this is the overview context about what you app is about.\\nRemember; The best the context, the better the translation results by the AI.'",
    "fileStartIndex": 7290,
    "fileEndIndex": 7567,
    "filePath": "/Users/igormidev/gobabel/go_babel_app/gobabel_flutter/lib/contexts_tab/ui/view/context_panel.dart",
    "children": [],
    "runtimeType": "rootLabel"
  },
  {
    "l10nKey": "projectLocalizedContexts",
    "hardcodedString": "'Project localized contexts'",
    "fileStartIndex": 9000,
    "fileEndIndex": 9028,
    "filePath": "/Users/igormidev/gobabel/go_babel_app/gobabel_flutter/lib/contexts_tab/ui/view/context_panel.dart",
    "children": [],
    "runtimeType": "rootLabel"
  },
  {
    "l10nKey": "allTheLocalizedContextsCreatedInThisProjectWillBeListedHere",
    "hardcodedString": "'All the localized contexts created in this project will be listed here.\\nYou can edit or delete them at any time.'",
    "fileStartIndex": 9383,
    "fileEndIndex": 9498,
    "filePath": "/Users/igormidev/gobabel/go_babel_app/gobabel_flutter/lib/contexts_tab/ui/view/context_panel.dart",
    "children": [],
    "runtimeType": "rootLabel"
  },
  {
    "l10nKey": "codebaseFolderStructure",
    "hardcodedString": "'Codebase folder structure'",
    "fileStartIndex": 11357,
    "fileEndIndex": 11384,
    "filePath": "/Users/igormidev/gobabel/go_babel_app/gobabel_flutter/lib/contexts_tab/ui/view/context_panel.dart",
    "children": [],
    "runtimeType": "rootLabel"
  },
  {
    "l10nKey": "youCanAddPromptContextsToSpecificFoldersInYourCodebase",
    "hardcodedString": "'You can add prompt contexts to specific folders in your codebase.\\nThis is useful when you have a folder that contains all the files related to a specific feature that you want to add a more detailed context for the hard coded strings in the files of that directory.'",
    "fileStartIndex": 11739,
    "fileEndIndex": 12007,
    "filePath": "/Users/igormidev/gobabel/go_babel_app/gobabel_flutter/lib/contexts_tab/ui/view/context_panel.dart",
    "children": [],
    "runtimeType": "rootLabel"
  },
  {
    "l10nKey": "finishedAddingProjectContexts",
    "hardcodedString": "'Finished adding project contexts?'",
    "fileStartIndex": 2314,
    "fileEndIndex": 2349,
    "filePath": "/Users/igormidev/gobabel/go_babel_app/gobabel_flutter/lib/contexts_tab/ui/widgets/get_started_cta.dart",
    "children": [],
    "runtimeType": "rootLabel"
  },
  {
    "l10nKey": "startTranslatingYourAppNow",
    "hardcodedString": "'Start translating your app <b><u>now<b><u>!'",
    "fileStartIndex": 2480,
    "fileEndIndex": 2525,
    "filePath": "/Users/igormidev/gobabel/go_babel_app/gobabel_flutter/lib/contexts_tab/ui/widgets/get_started_cta.dart",
    "children": [],
    "runtimeType": "rootLabel"
  },
  {
    "l10nKey": "creating",
    "hardcodedString": "'Creating...'",
    "fileStartIndex": 1471,
    "fileEndIndex": 1484,
    "filePath": "/Users/igormidev/gobabel/go_babel_app/gobabel_flutter/lib/contexts_tab/ui/widgets/editable_context_textfield.dart",
    "children": [],
    "runtimeType": "rootLabel"
  },
  {
    "l10nKey": "updating",
    "hardcodedString": "'Updating...'",
    "fileStartIndex": 1487,
    "fileEndIndex": 1500,
    "filePath": "/Users/igormidev/gobabel/go_babel_app/gobabel_flutter/lib/contexts_tab/ui/widgets/editable_context_textfield.dart",
    "children": [],
    "runtimeType": "rootLabel"
  },
  {
    "l10nKey": "typeherealocalizedcontexttext",
    "hardcodedString": "'Type here a localized context text that will be to the translation prompt... All the files inside \"$path\" will include this context when translating.'",
    "fileStartIndex": 1555,
    "fileEndIndex": 1706,
    "filePath": "/Users/igormidev/gobabel/go_babel_app/gobabel_flutter/lib/contexts_tab/ui/widgets/editable_context_textfield.dart",
    "children": [
      {
        "content": "$path",
        "parentStartIndex": 100,
        "parentEndIndex": 105,
        "children": [],
        "runtimeType": "labelDynamicValue"
      }
    ],
    "runtimeType": "rootLabel"
  },
  {
    "l10nKey": "close",
    "hardcodedString": "'Close'",
    "fileStartIndex": 3340,
    "fileEndIndex": 3347,
    "filePath": "/Users/igormidev/gobabel/go_babel_app/gobabel_flutter/lib/contexts_tab/ui/widgets/editable_context_textfield.dart",
    "children": [],
    "runtimeType": "rootLabel"
  },
  {
    "l10nKey": "willBeAppliedToAllFilesInside",
    "hardcodedString": "'Will be applied to <u>all<u> files inside <i>\"$path\"<i>'",
    "fileStartIndex": 3821,
    "fileEndIndex": 3878,
    "filePath": "/Users/igormidev/gobabel/go_babel_app/gobabel_flutter/lib/contexts_tab/ui/widgets/editable_context_textfield.dart",
    "children": [
      {
        "content": "$path",
        "parentStartIndex": 47,
        "parentEndIndex": 52,
        "children": [],
        "runtimeType": "labelDynamicValue"
      }
    ],
    "runtimeType": "rootLabel"
  },
  {
    "l10nKey": "new",
    "hardcodedString": "'New'",
    "fileStartIndex": 4678,
    "fileEndIndex": 4683,
    "filePath": "/Users/igormidev/gobabel/go_babel_app/gobabel_flutter/lib/contexts_tab/ui/widgets/editable_context_textfield.dart",
    "children": [],
    "runtimeType": "rootLabel"
  },
  {
    "l10nKey": "appliedToAllFilesInside",
    "hardcodedString": "'Applied to <u>all<u> files inside <i>\"$path\"<i>'",
    "fileStartIndex": 5004,
    "fileEndIndex": 5053,
    "filePath": "/Users/igormidev/gobabel/go_babel_app/gobabel_flutter/lib/contexts_tab/ui/widgets/editable_context_textfield.dart",
    "children": [
      {
        "content": "$path",
        "parentStartIndex": 39,
        "parentEndIndex": 44,
        "children": [],
        "runtimeType": "labelDynamicValue"
      }
    ],
    "runtimeType": "rootLabel"
  },
  {
    "l10nKey": "confirm",
    "hardcodedString": "'Confirm'",
    "fileStartIndex": 605,
    "fileEndIndex": 614,
    "filePath": "/Users/igormidev/gobabel/go_babel_app/gobabel_flutter/lib/design_system/dialog_message.dart",
    "children": [],
    "runtimeType": "rootLabel"
  },
  {
    "l10nKey": "confirm",
    "hardcodedString": "'Confirm'",
    "fileStartIndex": 1291,
    "fileEndIndex": 1300,
    "filePath": "/Users/igormidev/gobabel/go_babel_app/gobabel_flutter/lib/design_system/dialog_message.dart",
    "children": [],
    "runtimeType": "rootLabel"
  },
  {
    "l10nKey": "updating",
    "hardcodedString": "'Updating...'",
    "fileStartIndex": 1099,
    "fileEndIndex": 1112,
    "filePath": "/Users/igormidev/gobabel/go_babel_app/gobabel_flutter/lib/design_system/components/editable_text_field.dart",
    "children": [],
    "runtimeType": "rootLabel"
  },
  {
    "l10nKey": "typeHereTheAppContext",
    "hardcodedString": "'Type here the app context...\\nThe best the context, the better the translation results by the AI.'",
    "fileStartIndex": 3257,
    "fileEndIndex": 3356,
    "filePath": "/Users/igormidev/gobabel/go_babel_app/gobabel_flutter/lib/design_system/components/editable_text_field.dart",
    "children": [],
    "runtimeType": "rootLabel"
  },
  {
    "l10nKey": "save",
    "hardcodedString": "'Save'",
    "fileStartIndex": 3765,
    "fileEndIndex": 3771,
    "filePath": "/Users/igormidev/gobabel/go_babel_app/gobabel_flutter/lib/design_system/components/editable_text_field.dart",
    "children": [],
    "runtimeType": "rootLabel"
  },
  {
    "l10nKey": "error",
    "hardcodedString": "'Error'",
    "fileStartIndex": 793,
    "fileEndIndex": 800,
    "filePath": "/Users/igormidev/gobabel/go_babel_app/gobabel_flutter/lib/design_system/default_error_snackbar.dart",
    "children": [],
    "runtimeType": "rootLabel"
  },
  {
    "l10nKey": "anUnknownErrorOccurred",
    "hardcodedString": "'An unknown error occurred.'",
    "fileStartIndex": 817,
    "fileEndIndex": 845,
    "filePath": "/Users/igormidev/gobabel/go_babel_app/gobabel_flutter/lib/design_system/default_error_snackbar.dart",
    "children": [],
    "runtimeType": "rootLabel"
  },
  {
    "l10nKey": "anErrorOccurred",
    "hardcodedString": "'An error occurred'",
    "fileStartIndex": 206,
    "fileEndIndex": 225,
    "filePath": "/Users/igormidev/gobabel/go_babel_app/gobabel_flutter/lib/design_system/snackbar_message.dart",
    "children": [],
    "runtimeType": "rootLabel"
  },
  {
    "l10nKey": "loading",
    "hardcodedString": "'Loading...'",
    "fileStartIndex": 963,
    "fileEndIndex": 975,
    "filePath": "/Users/igormidev/gobabel/go_babel_app/gobabel_flutter/lib/design_system/widgets/ai_babel_loading_indicator.dart",
    "children": [],
    "runtimeType": "rootLabel"
  },
  {
    "l10nKey": "contactSupport",
    "hardcodedString": "'Contact support'",
    "fileStartIndex": 404,
    "fileEndIndex": 421,
    "filePath": "/Users/igormidev/gobabel/go_babel_app/gobabel_flutter/lib/design_system/widgets/contact_support_button.dart",
    "children": [],
    "runtimeType": "rootLabel"
  },
  {
    "l10nKey": "back",
    "hardcodedString": "'Back'",
    "fileStartIndex": 2043,
    "fileEndIndex": 2049,
    "filePath": "/Users/igormidev/gobabel/go_babel_app/gobabel_flutter/lib/project/ui/views/project_api_keys_view.dart",
    "children": [],
    "runtimeType": "rootLabel"
  },
  {
    "l10nKey": "projectApiKeys",
    "hardcodedString": "'Project api-keys'",
    "fileStartIndex": 2168,
    "fileEndIndex": 2186,
    "filePath": "/Users/igormidev/gobabel/go_babel_app/gobabel_flutter/lib/project/ui/views/project_api_keys_view.dart",
    "children": [],
    "runtimeType": "rootLabel"
  },
  {
    "l10nKey": "projectApiNameAndApiKey",
    "hardcodedString": "'<b>${projectApi.name}<b> <i><gC>(${projectApi.apiKey.toObscureText})<gC><i>'",
    "fileStartIndex": 3326,
    "fileEndIndex": 3403,
    "filePath": "/Users/igormidev/gobabel/go_babel_app/gobabel_flutter/lib/project/ui/views/project_api_keys_view.dart",
    "children": [
      {
        "content": "${projectApi.name}",
        "parentStartIndex": 4,
        "parentEndIndex": 22,
        "children": [],
        "runtimeType": "labelDynamicValue"
      },
      {
        "content": "${projectApi.apiKey.toObscureText}",
        "parentStartIndex": 34,
        "parentEndIndex": 68,
        "children": [],
        "runtimeType": "labelDynamicValue"
      }
    ],
    "runtimeType": "rootLabel"
  },
  {
    "l10nKey": "projectApiCreatedAt",
    "hardcodedString": "'Created at ${projectApi.createdAt.formatedDate(context)}'",
    "fileStartIndex": 3486,
    "fileEndIndex": 3544,
    "filePath": "/Users/igormidev/gobabel/go_babel_app/gobabel_flutter/lib/project/ui/views/project_api_keys_view.dart",
    "children": [
      {
        "content": "${projectApi.createdAt.formatedDate(context)}",
        "parentStartIndex": 12,
        "parentEndIndex": 57,
        "children": [],
        "runtimeType": "labelDynamicValue"
      }
    ],
    "runtimeType": "rootLabel"
  },
  {
    "l10nKey": "copyApiKey",
    "hardcodedString": "'Copy api key'",
    "fileStartIndex": 3676,
    "fileEndIndex": 3690,
    "filePath": "/Users/igormidev/gobabel/go_babel_app/gobabel_flutter/lib/project/ui/views/project_api_keys_view.dart",
    "children": [],
    "runtimeType": "rootLabel"
  },
  {
    "l10nKey": "apiKeyCopiedToClipboard",
    "hardcodedString": "'API key copied to clipboard'",
    "fileStartIndex": 4136,
    "fileEndIndex": 4165,
    "filePath": "/Users/igormidev/gobabel/go_babel_app/gobabel_flutter/lib/project/ui/views/project_api_keys_view.dart",
    "children": [],
    "runtimeType": "rootLabel"
  },
  {
    "l10nKey": "members",
    "hardcodedString": "'Members'",
    "fileStartIndex": 2307,
    "fileEndIndex": 2316,
    "filePath": "/Users/igormidev/gobabel/go_babel_app/gobabel_flutter/lib/project/ui/views/project_view.dart",
    "children": [],
    "runtimeType": "rootLabel"
  },
  {
    "l10nKey": "youNeedToFinishTheOnboardingFlowFirst",
    "hardcodedString": "'You need to finish the onboarding flow first\\n'",
    "fileStartIndex": 4238,
    "fileEndIndex": 4286,
    "filePath": "/Users/igormidev/gobabel/go_babel_app/gobabel_flutter/lib/project/ui/views/project_view.dart",
    "children": [],
    "runtimeType": "rootLabel"
  },
  {
    "l10nKey": "syncProjectLabelsToGoBabelSystem",
    "hardcodedString": "'Snyc the project labels to GoBabel system'",
    "fileStartIndex": 4327,
    "fileEndIndex": 4370,
    "filePath": "/Users/igormidev/gobabel/go_babel_app/gobabel_flutter/lib/project/ui/views/project_view.dart",
    "children": [],
    "runtimeType": "rootLabel"
  },
  {
    "l10nKey": "projectDetails",
    "hardcodedString": "'Project details'",
    "fileStartIndex": 6857,
    "fileEndIndex": 6874,
    "filePath": "/Users/igormidev/gobabel/go_babel_app/gobabel_flutter/lib/project/ui/views/project_view.dart",
    "children": [],
    "runtimeType": "rootLabel"
  },
  {
    "l10nKey": "projectName",
    "hardcodedString": "'Project name'",
    "fileStartIndex": 7557,
    "fileEndIndex": 7571,
    "filePath": "/Users/igormidev/gobabel/go_babel_app/gobabel_flutter/lib/project/ui/views/project_view.dart",
    "children": [],
    "runtimeType": "rootLabel"
  },
  {
    "l10nKey": "description",
    "hardcodedString": "'Description'",
    "fileStartIndex": 7804,
    "fileEndIndex": 7817,
    "filePath": "/Users/igormidev/gobabel/go_babel_app/gobabel_flutter/lib/project/ui/views/project_view.dart",
    "children": [],
    "runtimeType": "rootLabel"
  },
  {
    "l10nKey": "identifier",
    "hardcodedString": "'Identifier'",
    "fileStartIndex": 8041,
    "fileEndIndex": 8053,
    "filePath": "/Users/igormidev/gobabel/go_babel_app/gobabel_flutter/lib/project/ui/views/project_view.dart",
    "children": [],
    "runtimeType": "rootLabel"
  },
  {
    "l10nKey": "createdAt",
    "hardcodedString": "'Created at'",
    "fileStartIndex": 8437,
    "fileEndIndex": 8449,
    "filePath": "/Users/igormidev/gobabel/go_babel_app/gobabel_flutter/lib/project/ui/views/project_view.dart",
    "children": [],
    "runtimeType": "rootLabel"
  },
  {
    "l10nKey": "projectDetailsUpdatedAt",
    "hardcodedString": "'Project details updated at'",
    "fileStartIndex": 8693,
    "fileEndIndex": 8721,
    "filePath": "/Users/igormidev/gobabel/go_babel_app/gobabel_flutter/lib/project/ui/views/project_view.dart",
    "children": [],
    "runtimeType": "rootLabel"
  },
  {
    "l10nKey": "projectOwner",
    "hardcodedString": "'Project owner'",
    "fileStartIndex": 8965,
    "fileEndIndex": 8980,
    "filePath": "/Users/igormidev/gobabel/go_babel_app/gobabel_flutter/lib/project/ui/views/project_view.dart",
    "children": [],
    "runtimeType": "rootLabel"
  },
  {
    "l10nKey": "projectTierPlan",
    "hardcodedString": "'Project tier plan'",
    "fileStartIndex": 9414,
    "fileEndIndex": 9433,
    "filePath": "/Users/igormidev/gobabel/go_babel_app/gobabel_flutter/lib/project/ui/views/project_view.dart",
    "children": [],
    "runtimeType": "rootLabel"
  },
  {
    "l10nKey": "youNeedToFinishTheOnboardingFlowFirst",
    "hardcodedString": "'You need to finish the onboarding flow first\\n'",
    "fileStartIndex": 10357,
    "fileEndIndex": 10405,
    "filePath": "/Users/igormidev/gobabel/go_babel_app/gobabel_flutter/lib/project/ui/views/project_view.dart",
    "children": [],
    "runtimeType": "rootLabel"
  },
  {
    "l10nKey": "syncProjectLabelsToGoBabelSystem",
    "hardcodedString": "'Snyc the project labels to GoBabel system'",
    "fileStartIndex": 10446,
    "fileEndIndex": 10489,
    "filePath": "/Users/igormidev/gobabel/go_babel_app/gobabel_flutter/lib/project/ui/views/project_view.dart",
    "children": [],
    "runtimeType": "rootLabel"
  },
  {
    "l10nKey": "manageProjectApiKeys",
    "hardcodedString": "'Manage project api-keys'",
    "fileStartIndex": 11259,
    "fileEndIndex": 11284,
    "filePath": "/Users/igormidev/gobabel/go_babel_app/gobabel_flutter/lib/project/ui/views/project_view.dart",
    "children": [],
    "runtimeType": "rootLabel"
  },
  {
    "l10nKey": "addNewProjectApiKey",
    "hardcodedString": "'Add new project api key'",
    "fileStartIndex": 745,
    "fileEndIndex": 770,
    "filePath": "/Users/igormidev/gobabel/go_babel_app/gobabel_flutter/lib/project/ui/widgets/api_keys/add_new_project_new_api_key.dart",
    "children": [],
    "runtimeType": "rootLabel"
  },
  {
    "l10nKey": "apiKeyName",
    "hardcodedString": "'Api key name'",
    "fileStartIndex": 868,
    "fileEndIndex": 882,
    "filePath": "/Users/igormidev/gobabel/go_babel_app/gobabel_flutter/lib/project/ui/widgets/api_keys/add_new_project_new_api_key.dart",
    "children": [],
    "runtimeType": "rootLabel"
  },
  {
    "l10nKey": "addaidentifiernametotheapikey",
    "hardcodedString": "'Add a identifier name to the api key'",
    "fileStartIndex": 903,
    "fileEndIndex": 941,
    "filePath": "/Users/igormidev/gobabel/go_babel_app/gobabel_flutter/lib/project/ui/widgets/api_keys/add_new_project_new_api_key.dart",
    "children": [],
    "runtimeType": "rootLabel"
  },
  {
    "l10nKey": "addNewProjectApiKey",
    "hardcodedString": "'Add new project api key'",
    "fileStartIndex": 1528,
    "fileEndIndex": 1553,
    "filePath": "/Users/igormidev/gobabel/go_babel_app/gobabel_flutter/lib/project/ui/widgets/api_keys/add_new_project_new_api_key.dart",
    "children": [],
    "runtimeType": "rootLabel"
  },
  {
    "l10nKey": "thiswilladdanewprojectapikeytoyourworkspace",
    "hardcodedString": "'This will add a new project api key to your workspace. Do you want to continue?'",
    "fileStartIndex": 1588,
    "fileEndIndex": 1669,
    "filePath": "/Users/igormidev/gobabel/go_babel_app/gobabel_flutter/lib/project/ui/widgets/api_keys/add_new_project_new_api_key.dart",
    "children": [],
    "runtimeType": "rootLabel"
  },
  {
    "l10nKey": "removeMember",
    "hardcodedString": "'Remove member'",
    "fileStartIndex": 599,
    "fileEndIndex": 614,
    "filePath": "/Users/igormidev/gobabel/go_babel_app/gobabel_flutter/lib/project/ui/widgets/api_keys/delete_project_api_key.dart",
    "children": [],
    "runtimeType": "rootLabel"
  },
  {
    "l10nKey": "removeMember",
    "hardcodedString": "'Remove member'",
    "fileStartIndex": 675,
    "fileEndIndex": 690,
    "filePath": "/Users/igormidev/gobabel/go_babel_app/gobabel_flutter/lib/project/ui/widgets/members/delete_member_from_workspace_icon_button.dart",
    "children": [],
    "runtimeType": "rootLabel"
  },
  {
    "l10nKey": "addNewMemberToWorkspace",
    "hardcodedString": "'Add new member to workspace'",
    "fileStartIndex": 761,
    "fileEndIndex": 790,
    "filePath": "/Users/igormidev/gobabel/go_babel_app/gobabel_flutter/lib/project/ui/widgets/members/add_new_workspace_member_button.dart",
    "children": [],
    "runtimeType": "rootLabel"
  },
  {
    "l10nKey": "typeTheEmailOfTheNewMember",
    "hardcodedString": "'Type the email of the new member'",
    "fileStartIndex": 887,
    "fileEndIndex": 921,
    "filePath": "/Users/igormidev/gobabel/go_babel_app/gobabel_flutter/lib/project/ui/widgets/members/add_new_workspace_member_button.dart",
    "children": [],
    "runtimeType": "rootLabel"
  },
  {
    "l10nKey": "theMemberWillHaveAccessToViewAndEditAllLabels",
    "hardcodedString": "'The member will have access to view and edit all labels.'",
    "fileStartIndex": 942,
    "fileEndIndex": 1000,
    "filePath": "/Users/igormidev/gobabel/go_babel_app/gobabel_flutter/lib/project/ui/widgets/members/add_new_workspace_member_button.dart",
    "children": [],
    "runtimeType": "rootLabel"
  },
  {
    "l10nKey": "invalidEmail",
    "hardcodedString": "'Invalid email'",
    "fileStartIndex": 1505,
    "fileEndIndex": 1520,
    "filePath": "/Users/igormidev/gobabel/go_babel_app/gobabel_flutter/lib/project/ui/widgets/members/add_new_workspace_member_button.dart",
    "children": [],
    "runtimeType": "rootLabel"
  },
  {
    "l10nKey": "pleaseenteravalidemailaddress",
    "hardcodedString": "'Please enter a valid email address.'",
    "fileStartIndex": 1545,
    "fileEndIndex": 1582,
    "filePath": "/Users/igormidev/gobabel/go_babel_app/gobabel_flutter/lib/project/ui/widgets/members/add_new_workspace_member_button.dart",
    "children": [],
    "runtimeType": "rootLabel"
  },
  {
    "l10nKey": "userNotFound",
    "hardcodedString": "'User not found'",
    "fileStartIndex": 2225,
    "fileEndIndex": 2241,
    "filePath": "/Users/igormidev/gobabel/go_babel_app/gobabel_flutter/lib/dashboard/ui/view/pricing_page.dart",
    "children": [],
    "runtimeType": "rootLabel"
  },
  {
    "l10nKey": "opss",
    "hardcodedString": "'Opss!'",
    "fileStartIndex": 485,
    "fileEndIndex": 492,
    "filePath": "/Users/igormidev/gobabel/go_babel_app/gobabel_flutter/lib/dashboard/ui/view/owner_did_not_paid_page.dart",
    "children": [],
    "runtimeType": "rootLabel"
  },
  {
    "l10nKey": "theOwnerOfThisProjectIsNotUpToDateWithTheGoBabelSubscriptionPayment",
    "hardcodedString": "'The owner of this project is not up to date with the GoBabel subscription payment.\\nPlease contact the owner to resolve this issue.'",
    "fileStartIndex": 672,
    "fileEndIndex": 805,
    "filePath": "/Users/igormidev/gobabel/go_babel_app/gobabel_flutter/lib/dashboard/ui/view/owner_did_not_paid_page.dart",
    "children": [],
    "runtimeType": "rootLabel"
  },
  {
    "l10nKey": "thisAppIsNotSupportedInCompactSize",
    "hardcodedString": "'This app is not supported in compact size'",
    "fileStartIndex": 7155,
    "fileEndIndex": 7198,
    "filePath": "/Users/igormidev/gobabel/go_babel_app/gobabel_flutter/lib/dashboard/ui/view/dashboard_view.dart",
    "children": [],
    "runtimeType": "rootLabel"
  },
  {
    "l10nKey": "labels",
    "hardcodedString": "'Labels'",
    "fileStartIndex": 10863,
    "fileEndIndex": 10871,
    "filePath": "/Users/igormidev/gobabel/go_babel_app/gobabel_flutter/lib/dashboard/ui/view/dashboard_view.dart",
    "children": [],
    "runtimeType": "rootLabel"
  },
  {
    "l10nKey": "context",
    "hardcodedString": "'Context'",
    "fileStartIndex": 11006,
    "fileEndIndex": 11015,
    "filePath": "/Users/igormidev/gobabel/go_babel_app/gobabel_flutter/lib/dashboard/ui/view/dashboard_view.dart",
    "children": [],
    "runtimeType": "rootLabel"
  },
  {
    "l10nKey": "account",
    "hardcodedString": "'Account'",
    "fileStartIndex": 11175,
    "fileEndIndex": 11184,
    "filePath": "/Users/igormidev/gobabel/go_babel_app/gobabel_flutter/lib/dashboard/ui/view/dashboard_view.dart",
    "children": [],
    "runtimeType": "rootLabel"
  },
  {
    "l10nKey": "getStarted",
    "hardcodedString": "'Get started'",
    "fileStartIndex": 11315,
    "fileEndIndex": 11328,
    "filePath": "/Users/igormidev/gobabel/go_babel_app/gobabel_flutter/lib/dashboard/ui/view/dashboard_view.dart",
    "children": [],
    "runtimeType": "rootLabel"
  },
  {
    "l10nKey": "project",
    "hardcodedString": "'Project'",
    "fileStartIndex": 11462,
    "fileEndIndex": 11471,
    "filePath": "/Users/igormidev/gobabel/go_babel_app/gobabel_flutter/lib/dashboard/ui/view/dashboard_view.dart",
    "children": [],
    "runtimeType": "rootLabel"
  },
  {
    "l10nKey": "history",
    "hardcodedString": "'History'",
    "fileStartIndex": 11599,
    "fileEndIndex": 11608,
    "filePath": "/Users/igormidev/gobabel/go_babel_app/gobabel_flutter/lib/dashboard/ui/view/dashboard_view.dart",
    "children": [],
    "runtimeType": "rootLabel"
  },
  {
    "l10nKey": "logOut",
    "hardcodedString": "'Log out'",
    "fileStartIndex": 11757,
    "fileEndIndex": 11766,
    "filePath": "/Users/igormidev/gobabel/go_babel_app/gobabel_flutter/lib/dashboard/ui/view/dashboard_view.dart",
    "children": [],
    "runtimeType": "rootLabel"
  },
  {
    "l10nKey": "loading",
    "hardcodedString": "'Loading...'",
    "fileStartIndex": 2081,
    "fileEndIndex": 2093,
    "filePath": "/Users/igormidev/gobabel/go_babel_app/gobabel_flutter/lib/dashboard/ui/pages/dashboard_loading_page.dart",
    "children": [],
    "runtimeType": "rootLabel"
  },
  {
    "l10nKey": "ops",
    "hardcodedString": "'Ops...'",
    "fileStartIndex": 735,
    "fileEndIndex": 743,
    "filePath": "/Users/igormidev/gobabel/go_babel_app/gobabel_flutter/lib/dashboard/ui/widgets/dashboard_error_tab.dart",
    "children": [],
    "runtimeType": "rootLabel"
  },
  {
    "l10nKey": "contactSupport",
    "hardcodedString": "'Contact support'",
    "fileStartIndex": 1570,
    "fileEndIndex": 1587,
    "filePath": "/Users/igormidev/gobabel/go_babel_app/gobabel_flutter/lib/dashboard/ui/widgets/dashboard_error_tab.dart",
    "children": [],
    "runtimeType": "rootLabel"
  },
  {
    "l10nKey": "changeSelectedProject",
    "hardcodedString": "'Change selected project'",
    "fileStartIndex": 1203,
    "fileEndIndex": 1228,
    "filePath": "/Users/igormidev/gobabel/go_babel_app/gobabel_flutter/lib/dashboard/ui/widgets/change_project.dart",
    "children": [],
    "runtimeType": "rootLabel"
  },
  {
    "l10nKey": "selectaprojectorcreateanewone",
    "hardcodedString": "'Select a project (or create a new one)'",
    "fileStartIndex": 1576,
    "fileEndIndex": 1616,
    "filePath": "/Users/igormidev/gobabel/go_babel_app/gobabel_flutter/lib/dashboard/ui/widgets/change_project.dart",
    "children": [],
    "runtimeType": "rootLabel"
  },
  {
    "l10nKey": "createNewProject",
    "hardcodedString": "'Create new project'",
    "fileStartIndex": 1963,
    "fileEndIndex": 1983,
    "filePath": "/Users/igormidev/gobabel/go_babel_app/gobabel_flutter/lib/dashboard/ui/widgets/change_project.dart",
    "children": [],
    "runtimeType": "rootLabel"
  },
  {
    "l10nKey": "noProjectConfigured",
    "hardcodedString": "'No project configured'",
    "fileStartIndex": 1246,
    "fileEndIndex": 1269,
    "filePath": "/Users/igormidev/gobabel/go_babel_app/gobabel_flutter/lib/dashboard/ui/widgets/no_project_indicator.dart",
    "children": [],
    "runtimeType": "rootLabel"
  },
  {
    "l10nKey": "howToAddProject",
    "hardcodedString": "'How to add project'",
    "fileStartIndex": 1310,
    "fileEndIndex": 1330,
    "filePath": "/Users/igormidev/gobabel/go_babel_app/gobabel_flutter/lib/dashboard/ui/widgets/no_project_indicator.dart",
    "children": [],
    "runtimeType": "rootLabel"
  },
  {
    "l10nKey": "runTheFollowingCodeInYourTerminalToAdd",
    "hardcodedString": "'Run the following code in your terminal to add '",
    "fileStartIndex": 1580,
    "fileEndIndex": 1629,
    "filePath": "/Users/igormidev/gobabel/go_babel_app/gobabel_flutter/lib/dashboard/ui/widgets/no_project_indicator.dart",
    "children": [],
    "runtimeType": "rootLabel"
  },
  {
    "l10nKey": "yourProjectToTheGoBabelSystem",
    "hardcodedString": "'your project to the GoBabel system '",
    "fileStartIndex": 1652,
    "fileEndIndex": 1689,
    "filePath": "/Users/igormidev/gobabel/go_babel_app/gobabel_flutter/lib/dashboard/ui/widgets/no_project_indicator.dart",
    "children": [],
    "runtimeType": "rootLabel"
  },
  {
    "l10nKey": "soWeCanStartTranslatingYourApp",
    "hardcodedString": "'so we can start translating your app.'",
    "fileStartIndex": 1712,
    "fileEndIndex": 1751,
    "filePath": "/Users/igormidev/gobabel/go_babel_app/gobabel_flutter/lib/dashboard/ui/widgets/no_project_indicator.dart",
    "children": [],
    "runtimeType": "rootLabel"
  },
  {
    "l10nKey": "runTheFollowingCodeInYourTerminalToAdd",
    "hardcodedString": "'Run the following code in your terminal to add '",
    "fileStartIndex": 1810,
    "fileEndIndex": 1859,
    "filePath": "/Users/igormidev/gobabel/go_babel_app/gobabel_flutter/lib/dashboard/ui/widgets/no_project_indicator.dart",
    "children": [],
    "runtimeType": "rootLabel"
  },
  {
    "l10nKey": "yourProjectToTheGoBabelSystem",
    "hardcodedString": "'your project to the GoBabel system '",
    "fileStartIndex": 1882,
    "fileEndIndex": 1919,
    "filePath": "/Users/igormidev/gobabel/go_babel_app/gobabel_flutter/lib/dashboard/ui/widgets/no_project_indicator.dart",
    "children": [],
    "runtimeType": "rootLabel"
  },
  {
    "l10nKey": "soWeCanStartTranslatingIt",
    "hardcodedString": "'so we can start translating it.'",
    "fileStartIndex": 1942,
    "fileEndIndex": 1975,
    "filePath": "/Users/igormidev/gobabel/go_babel_app/gobabel_flutter/lib/dashboard/ui/widgets/no_project_indicator.dart",
    "children": [],
    "runtimeType": "rootLabel"
  },
  {
    "l10nKey": "needMoreHelp",
    "hardcodedString": "'Need more help?'",
    "fileStartIndex": 3270,
    "fileEndIndex": 3287,
    "filePath": "/Users/igormidev/gobabel/go_babel_app/gobabel_flutter/lib/dashboard/ui/widgets/no_project_indicator.dart",
    "children": [],
    "runtimeType": "rootLabel"
  },
  {
    "l10nKey": "openDevDocumentation",
    "hardcodedString": "'Open dev documentation'",
    "fileStartIndex": 3425,
    "fileEndIndex": 3449,
    "filePath": "/Users/igormidev/gobabel/go_babel_app/gobabel_flutter/lib/dashboard/ui/widgets/no_project_indicator.dart",
    "children": [],
    "runtimeType": "rootLabel"
  },
  {
    "l10nKey": "appVersion",
    "hardcodedString": "'App version: $currentVersionString'",
    "fileStartIndex": 828,
    "fileEndIndex": 864,
    "filePath": "/Users/igormidev/gobabel/go_babel_app/gobabel_flutter/lib/dashboard/ui/widgets/version_indicator.dart",
    "children": [
      {
        "content": "$currentVersionString",
        "parentStartIndex": 14,
        "parentEndIndex": 35,
        "children": [],
        "runtimeType": "labelDynamicValue"
      }
    ],
    "runtimeType": "rootLabel"
  },
  {
    "l10nKey": "collapseTab",
    "hardcodedString": "'Collapse tab'",
    "fileStartIndex": 2184,
    "fileEndIndex": 2198,
    "filePath": "/Users/igormidev/gobabel/go_babel_app/gobabel_flutter/lib/dashboard/ui/widgets/version_indicator.dart",
    "children": [],
    "runtimeType": "rootLabel"
  },
  {
    "l10nKey": "theLabelThatWillBeDisplayedToTheUser",
    "hardcodedString": "'The label that will be displayed to the user when selected language is ${locale.locale}'",
    "fileStartIndex": 2078,
    "fileEndIndex": 2167,
    "filePath": "/Users/igormidev/gobabel/go_babel_app/gobabel_flutter/lib/labels_panel/ui/tabs/selected_label_info_tab.dart",
    "children": [
      {
        "content": "${locale.locale}",
        "parentStartIndex": 72,
        "parentEndIndex": 88,
        "children": [],
        "runtimeType": "labelDynamicValue"
      }
    ],
    "runtimeType": "rootLabel"
  },
  {
    "l10nKey": "localeCleanDisplayNameAndCode",
    "hardcodedString": "'${locale.cleanDisplayName} <gC>(${locale.languageCode}_${locale.countryCode})<gC>'",
    "fileStartIndex": 2340,
    "fileEndIndex": 2423,
    "filePath": "/Users/igormidev/gobabel/go_babel_app/gobabel_flutter/lib/labels_panel/ui/sections/labels_listage.dart",
    "children": [
      {
        "content": "${locale.cleanDisplayName}",
        "parentStartIndex": 1,
        "parentEndIndex": 27,
        "children": [],
        "runtimeType": "labelDynamicValue"
      },
      {
        "content": "${locale.languageCode}",
        "parentStartIndex": 33,
        "parentEndIndex": 55,
        "children": [],
        "runtimeType": "labelDynamicValue"
      },
      {
        "content": "${locale.countryCode}",
        "parentStartIndex": 56,
        "parentEndIndex": 77,
        "children": [],
        "runtimeType": "labelDynamicValue"
      }
    ],
    "runtimeType": "rootLabel"
  },
  {
    "l10nKey": "thisAppIsNotSupportedOnMobileDevices",
    "hardcodedString": "'This app is not\\nsupported on mobile devices'",
    "fileStartIndex": 1245,
    "fileEndIndex": 1291,
    "filePath": "/Users/igormidev/gobabel/go_babel_app/gobabel_flutter/lib/labels_panel/ui/view/labels_editor_view.dart",
    "children": [],
    "runtimeType": "rootLabel"
  },
  {
    "l10nKey": "extractAndUploadTheLabelsOfYourProject",
    "hardcodedString": "'Extract and upload the labels of your project'",
    "fileStartIndex": 851,
    "fileEndIndex": 898,
    "filePath": "/Users/igormidev/gobabel/go_babel_app/gobabel_flutter/lib/labels_panel/ui/view/pending_first_label_attach.dart",
    "children": [],
    "runtimeType": "rootLabel"
  },
  {
    "l10nKey": "runTheCommandBelowToExtractAllTheHardcodedStrings",
    "hardcodedString": "'Run the command below to <u>extract<u> all the hardcoded strings from your project and upload them to your Gobabel system so you.'",
    "fileStartIndex": 1155,
    "fileEndIndex": 1286,
    "filePath": "/Users/igormidev/gobabel/go_babel_app/gobabel_flutter/lib/labels_panel/ui/view/pending_first_label_attach.dart",
    "children": [],
    "runtimeType": "rootLabel"
  },
  {
    "l10nKey": "selectedProject",
    "hardcodedString": "'$selectedProject'",
    "fileStartIndex": 2078,
    "fileEndIndex": 2096,
    "filePath": "/Users/igormidev/gobabel/go_babel_app/gobabel_flutter/lib/labels_panel/ui/view/pending_first_label_attach.dart",
    "children": [
      {
        "content": "$selectedProject",
        "parentStartIndex": 1,
        "parentEndIndex": 17,
        "children": [],
        "runtimeType": "labelDynamicValue"
      }
    ],
    "runtimeType": "rootLabel"
  },
  {
    "l10nKey": "needMoreHelp",
    "hardcodedString": "'Need more help?'",
    "fileStartIndex": 2851,
    "fileEndIndex": 2868,
    "filePath": "/Users/igormidev/gobabel/go_babel_app/gobabel_flutter/lib/labels_panel/ui/view/pending_first_label_attach.dart",
    "children": [],
    "runtimeType": "rootLabel"
  },
  {
    "l10nKey": "openDevDocumentation",
    "hardcodedString": "'Open dev documentation'",
    "fileStartIndex": 3006,
    "fileEndIndex": 3030,
    "filePath": "/Users/igormidev/gobabel/go_babel_app/gobabel_flutter/lib/labels_panel/ui/view/pending_first_label_attach.dart",
    "children": [],
    "runtimeType": "rootLabel"
  },
  {
    "l10nKey": "search",
    "hardcodedString": "'Search'",
    "fileStartIndex": 1030,
    "fileEndIndex": 1038,
    "filePath": "/Users/igormidev/gobabel/go_babel_app/gobabel_flutter/lib/labels_panel/ui/widgets/label_search_bar.dart",
    "children": [],
    "runtimeType": "rootLabel"
  },
  {
    "l10nKey": "search",
    "hardcodedString": "'Search'",
    "fileStartIndex": 1133,
    "fileEndIndex": 1141,
    "filePath": "/Users/igormidev/gobabel/go_babel_app/gobabel_flutter/lib/labels_panel/ui/widgets/label_search_bar.dart",
    "children": [],
    "runtimeType": "rootLabel"
  },
  {
    "l10nKey": "loadMore",
    "hardcodedString": "'Load more'",
    "fileStartIndex": 3560,
    "fileEndIndex": 3571,
    "filePath": "/Users/igormidev/gobabel/go_babel_app/gobabel_flutter/lib/history/history_listage.dart",
    "children": [],
    "runtimeType": "rootLabel"
  },
  {
    "l10nKey": "noMoreDataToBeLoaded",
    "hardcodedString": "'No more data to be loaded...'",
    "fileStartIndex": 3970,
    "fileEndIndex": 4000,
    "filePath": "/Users/igormidev/gobabel/go_babel_app/gobabel_flutter/lib/history/history_listage.dart",
    "children": [],
    "runtimeType": "rootLabel"
  },
  {
    "l10nKey": "historyCreatedAtFromAuthor",
    "hardcodedString": "'Created at <i><pC>${history.createdAt.formatedDate}<pC><i> from ${history.generatedByGitUser.authorName} (${history.generatedByGitUser.authorEmail})'",
    "fileStartIndex": 4778,
    "fileEndIndex": 4928,
    "filePath": "/Users/igormidev/gobabel/go_babel_app/gobabel_flutter/lib/history/history_listage.dart",
    "children": [
      {
        "content": "${history.createdAt.formatedDate}",
        "parentStartIndex": 19,
        "parentEndIndex": 52,
        "children": [],
        "runtimeType": "labelDynamicValue"
      },
      {
        "content": "${history.generatedByGitUser.authorName}",
        "parentStartIndex": 65,
        "parentEndIndex": 105,
        "children": [],
        "runtimeType": "labelDynamicValue"
      },
      {
        "content": "${history.generatedByGitUser.authorEmail}",
        "parentStartIndex": 107,
        "parentEndIndex": 148,
        "children": [],
        "runtimeType": "labelDynamicValue"
      }
    ],
    "runtimeType": "rootLabel"
  },
  {
    "l10nKey": "builtOnTopOfCommitToGenerateTranslations",
    "hardcodedString": "'Built on top of commit <u><pC><messageOnTopOfCommit><onTapOfCommit>${history.generatedOnTopOfCommit.shaHash}<onTapOfCommit><messageOnTopOfCommit><pC><u>${history.generatedLabelsCommit != null ? ' to generate translations that are in commit <u><pC><labelsBotCommit><onTapLabelsBotCommit>${history.generatedLabelsCommit!.shaHash}<onTapLabelsBotCommit><labelsBotCommit><pC><u>' : ''}'",
    "fileStartIndex": 4978,
    "fileEndIndex": 5360,
    "filePath": "/Users/igormidev/gobabel/go_babel_app/gobabel_flutter/lib/history/history_listage.dart",
    "children": [
      {
        "content": "${history.generatedOnTopOfCommit.shaHash}",
        "parentStartIndex": 68,
        "parentEndIndex": 109,
        "children": [],
        "runtimeType": "labelDynamicValue"
      },
      {
        "content": "${history.generatedLabelsCommit != null ? ' to generate translations that are in commit <u><pC><labelsBotCommit><onTapLabelsBotCommit>${history.generatedLabelsCommit!.shaHash}<onTapLabelsBotCommit><labelsBotCommit><pC><u>' : ''}",
        "parentStartIndex": 153,
        "parentEndIndex": 381,
        "children": [],
        "runtimeType": "labelDynamicValue"
      }
    ],
    "runtimeType": "rootLabel"
  },
  {
    "l10nKey": "messageOnTopOfCommit",
    "hardcodedString": "'<messageOnTopOfCommit>'",
    "fileStartIndex": 5417,
    "fileEndIndex": 5441,
    "filePath": "/Users/igormidev/gobabel/go_babel_app/gobabel_flutter/lib/history/history_listage.dart",
    "children": [],
    "runtimeType": "rootLabel"
  },
  {
    "l10nKey": "message",
    "hardcodedString": "'Message: ${history.generatedOnTopOfCommit.message}'",
    "fileStartIndex": 5530,
    "fileEndIndex": 5582,
    "filePath": "/Users/igormidev/gobabel/go_babel_app/gobabel_flutter/lib/history/history_listage.dart",
    "children": [
      {
        "content": "${history.generatedOnTopOfCommit.message}",
        "parentStartIndex": 10,
        "parentEndIndex": 51,
        "children": [],
        "runtimeType": "labelDynamicValue"
      }
    ],
    "runtimeType": "rootLabel"
  },
  {
    "l10nKey": "labelsBotCommit",
    "hardcodedString": "'<labelsBotCommit>'",
    "fileStartIndex": 5623,
    "fileEndIndex": 5642,
    "filePath": "/Users/igormidev/gobabel/go_babel_app/gobabel_flutter/lib/history/history_listage.dart",
    "children": [],
    "runtimeType": "rootLabel"
  },
  {
    "l10nKey": "message",
    "hardcodedString": "'Message: ${history.generatedOnTopOfCommit.message}'",
    "fileStartIndex": 5731,
    "fileEndIndex": 5783,
    "filePath": "/Users/igormidev/gobabel/go_babel_app/gobabel_flutter/lib/history/history_listage.dart",
    "children": [
      {
        "content": "${history.generatedOnTopOfCommit.message}",
        "parentStartIndex": 10,
        "parentEndIndex": 51,
        "children": [],
        "runtimeType": "labelDynamicValue"
      }
    ],
    "runtimeType": "rootLabel"
  },
  {
    "l10nKey": "onTapOfCommit",
    "hardcodedString": "'<onTapOfCommit>'",
    "fileStartIndex": 5871,
    "fileEndIndex": 5888,
    "filePath": "/Users/igormidev/gobabel/go_babel_app/gobabel_flutter/lib/history/history_listage.dart",
    "children": [],
    "runtimeType": "rootLabel"
  },
  {
    "l10nKey": "unableToOpenCommitUrl",
    "hardcodedString": "'Unable to open commit URL. Unknown git origin url.'",
    "fileStartIndex": 6157,
    "fileEndIndex": 6209,
    "filePath": "/Users/igormidev/gobabel/go_babel_app/gobabel_flutter/lib/history/history_listage.dart",
    "children": [],
    "runtimeType": "rootLabel"
  },
  {
    "l10nKey": "onTapLabelsBotCommit",
    "hardcodedString": "'<onTapLabelsBotCommit>'",
    "fileStartIndex": 6267,
    "fileEndIndex": 6291,
    "filePath": "/Users/igormidev/gobabel/go_babel_app/gobabel_flutter/lib/history/history_listage.dart",
    "children": [],
    "runtimeType": "rootLabel"
  },
  {
    "l10nKey": "unableToOpenCommitUrl",
    "hardcodedString": "'Unable to open commit URL. Unknown git origin url.'",
    "fileStartIndex": 6562,
    "fileEndIndex": 6614,
    "filePath": "/Users/igormidev/gobabel/go_babel_app/gobabel_flutter/lib/history/history_listage.dart",
    "children": [],
    "runtimeType": "rootLabel"
  },
  {
    "l10nKey": "helloUserName",
    "hardcodedString": "\"Hello, $userName!\"",
    "fileStartIndex": 525,
    "fileEndIndex": 544,
    "filePath": "/Users/igormidev/gobabel/go_babel_app/gobabel_flutter/lib/example.dart",
    "children": [
      {
        "content": "$userName",
        "parentStartIndex": 8,
        "parentEndIndex": 17,
        "children": [],
        "runtimeType": "labelDynamicValue"
      }
    ],
    "runtimeType": "rootLabel"
  },
  {
    "l10nKey": "anotherTest",
    "hardcodedString": "\"\"\"\nAnother test\"\"\"",
    "fileStartIndex": 675,
    "fileEndIndex": 694,
    "filePath": "/Users/igormidev/gobabel/go_babel_app/gobabel_flutter/lib/example.dart",
    "children": [],
    "runtimeType": "rootLabel"
  },
  {
    "l10nKey": "account",
    "hardcodedString": "'Account'",
    "fileStartIndex": 1401,
    "fileEndIndex": 1410,
    "filePath": "/Users/igormidev/gobabel/go_babel_app/gobabel_flutter/lib/account/ui/views/account_view.dart",
    "children": [],
    "runtimeType": "rootLabel"
  },
  {
    "l10nKey": "accountInformation",
    "hardcodedString": "'Account information'",
    "fileStartIndex": 1951,
    "fileEndIndex": 1972,
    "filePath": "/Users/igormidev/gobabel/go_babel_app/gobabel_flutter/lib/account/ui/views/account_view.dart",
    "children": [],
    "runtimeType": "rootLabel"
  },
  {
    "l10nKey": "userName",
    "hardcodedString": "'User name'",
    "fileStartIndex": 2173,
    "fileEndIndex": 2184,
    "filePath": "/Users/igormidev/gobabel/go_babel_app/gobabel_flutter/lib/account/ui/views/account_view.dart",
    "children": [],
    "runtimeType": "rootLabel"
  },
  {
    "l10nKey": "email",
    "hardcodedString": "'Email'",
    "fileStartIndex": 2370,
    "fileEndIndex": 2377,
    "filePath": "/Users/igormidev/gobabel/go_babel_app/gobabel_flutter/lib/account/ui/views/account_view.dart",
    "children": [],
    "runtimeType": "rootLabel"
  },
  {
    "l10nKey": "yourAccountApiKey",
    "hardcodedString": "'Your account <b>api key<b>'",
    "fileStartIndex": 2560,
    "fileEndIndex": 2588,
    "filePath": "/Users/igormidev/gobabel/go_babel_app/gobabel_flutter/lib/account/ui/views/account_view.dart",
    "children": [],
    "runtimeType": "rootLabel"
  },
  {
    "l10nKey": "loading",
    "hardcodedString": "'Loading...'",
    "fileStartIndex": 1568,
    "fileEndIndex": 1580,
    "filePath": "/Users/igormidev/gobabel/go_babel_app/gobabel_flutter/lib/account/ui/widgets/user_editable_profile_image.dart",
    "children": [],
    "runtimeType": "rootLabel"
  },
  {
    "l10nKey": "changeImage",
    "hardcodedString": "'Change image'",
    "fileStartIndex": 2195,
    "fileEndIndex": 2209,
    "filePath": "/Users/igormidev/gobabel/go_babel_app/gobabel_flutter/lib/account/ui/widgets/user_editable_profile_image.dart",
    "children": [],
    "runtimeType": "rootLabel"
  }
]''';
