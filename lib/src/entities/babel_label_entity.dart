import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gobabel_core/gobabel_core.dart';

part 'babel_label_entity.freezed.dart';
part 'babel_label_entity.g.dart';

@freezed
sealed class BabelLabelEntity with _$BabelLabelEntity {
  factory BabelLabelEntity.rootLabel({
    required L10nKey l10nKey,
    required L10nValue l10nValue,
    required BabelFunctionDeclaration babelFunctionDeclaration,
    required BabelFunctionImplementation babelFunctionImplementation,
    required int fileStartIndex,
    required int fileEndIndex,
    required String filePath,
    required List<BabelLabelEntity> children,
  }) = BabelLabelEntityRootLabel;

  factory BabelLabelEntity.childLabel({
    required L10nKey l10nKey, // ✅ CHECK
    required L10nValue l10nValue,
    required BabelFunctionDeclaration babelFunctionDeclaration,
    required BabelFunctionImplementation babelFunctionImplementation,
    required int parentStartIndex, // ✅ CHECK
    required int parentEndIndex, // ✅ CHECK
    required List<BabelLabelEntity> children, // ✅ CHECK
  }) = BabelLabelEntityChildLabel;

  factory BabelLabelEntity.labelDynamicValue({
    required String content,
    required int parentStartIndex,
    required int parentEndIndex,
    required List<BabelLabelEntity> children,
  }) = BabelLabelEntityLabelDynamicValue;

  factory BabelLabelEntity.fromJson(Map<String, dynamic> map) =>
      _$BabelLabelEntityFromJson(map);
}
