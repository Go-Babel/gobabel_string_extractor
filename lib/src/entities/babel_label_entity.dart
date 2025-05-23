import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gobabel_core/gobabel_core.dart';
import 'package:gobabel_string_extractor/src/entities/labels_entity.dart';

part 'babel_label_entity.freezed.dart';

@freezed
abstract class BabelLabelEntity with _$BabelLabelEntity {
  factory BabelLabelEntity.rootLabel({
    required L10nKey l10nKey,
    required L10nValue l10nValue,
    required BabelFunctionDeclaration babelFunctionDeclaration,
    required BabelFunctionImplementation babelFunctionImplementation,
    required int fileStartIndex,
    required int fileEndIndex,
    required String filePath,
    required List<LabelsEntity> children,
  }) = BabelLabelEntityRootLabel;

  factory BabelLabelEntity.childLabel({
    required L10nKey l10nKey,
    required L10nValue l10nValue,
    required BabelFunctionDeclaration babelFunctionDeclaration,
    required BabelFunctionImplementation babelFunctionImplementation,
    required int parentStartIndex,
    required int parentEndIndex,
    required String filePath,
    required List<LabelsEntity> children,
  }) = BabelLabelEntityChildLabel;

  factory BabelLabelEntity.labelDynamicValue({
    required String content,
    required int parentStartIndex,
    required int parentEndIndex,
    required String filePath,
    required List<LabelsEntity> children,
  }) = BabelLabelEntityLabelDynamicValue;
}
