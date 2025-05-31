import 'package:gobabel_string_extractor/src/core/extensions/string_extension.dart';
import 'package:test/test.dart';

void main() {
  test('string extension ...', () {
    final list = <String>[
      r"${ref.read(projectProvider)}",
      r"$email",
      r"${folderInfo.fullPath}",
      r"$path",
      r"$path",
      r"$path",
      r"${projectApi.name}",
      r"${projectApi.apiKey.toObscureText}",
      r"${projectApi.createdAt.formatedDate(context)}",
      r"$currentVersionString",
      r"${locale.locale}",
      r"${locale.cleanDisplayName}",
      r"${locale.languageCode}",
      r"${locale.countryCode}",
      r"$selectedProject",
      r"${history.createdAt.formatedDate}",
      r"${history.generatedByGitUser.authorName}",
      r"${history.generatedByGitUser.authorEmail}",
      r"${history.generatedOnTopOfCommit.shaHash}",
      r"${history.generatedLabelsCommit != null ? ' to generate translations that are in commit <u><pC><labelsBotCommit><onTapLabelsBotCommit>${history.generatedLabelsCommit!.shaHash}<onTapLabelsBotCommit><labelsBotCommit><pC><u>' : ''}",
      r"${history.generatedOnTopOfCommit.message}",
      r"${history.generatedOnTopOfCommit.message}",
      r"$userName",
    ].map((e) => e.cleanHardcoded).toList();

    final expected = [
      "ref.read(projectProvider)",
      "email",
      "folderInfo.fullPath",
      "path",
      "path",
      "path",
      "projectApi.name",
      "projectApi.apiKey.toObscureText",
      "projectApi.createdAt.formatedDate(context)",
      "currentVersionString",
      "locale.locale",
      "locale.cleanDisplayName",
      "locale.languageCode",
      "locale.countryCode",
      "selectedProject",
      "history.createdAt.formatedDate",
      "history.generatedByGitUser.authorName",
      "history.generatedByGitUser.authorEmail",
      "history.generatedOnTopOfCommit.shaHash",
      r"history.generatedLabelsCommit != null ? ' to generate translations that are in commit <u><pC><labelsBotCommit><onTapLabelsBotCommit>${history.generatedLabelsCommit!.shaHash}<onTapLabelsBotCommit><labelsBotCommit><pC><u>' : ''",
      "history.generatedOnTopOfCommit.message",
      "history.generatedOnTopOfCommit.message",
      "userName",
    ];
    expect(list, expected);
  });
}
