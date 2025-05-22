import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gobabel_core/gobabel_core.dart';

part 'labels_entities.freezed.dart';

@freezed
abstract class LabelsEntities with _$LabelsEntities {
  factory LabelsEntities.rootLabel({
    required L10nKey l10nKey,
    required L10nValue l10nValue,
    required BabelFunctionDeclaration babelFunctionDeclaration,
    required BabelFunctionImplementation babelFunctionImplementation,
    required int fileStartIndex,
    required int fileEndIndex,
    required List<LabelsEntities> children,
  }) = LabelsEntitiesRootLabel;

  factory LabelsEntities.childLabel({
    required L10nKey l10nKey,
    required L10nValue l10nValue,
    required BabelFunctionDeclaration babelFunctionDeclaration,
    required BabelFunctionImplementation babelFunctionImplementation,
    required int parentStartIndex,
    required int parentEndIndex,
    required List<LabelsEntities> children,
  }) = LabelsEntitiesChildLabel;

  factory LabelsEntities.labelDynamicValue({
    required String content,
    required int parentStartIndex,
    required int parentEndIndex,
    required List<LabelsEntities> children,
  }) = LabelsEntitiesLabelDynamicValue;
}
