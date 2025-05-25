import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gobabel_core/gobabel_core.dart';

part 'labels_entity.freezed.dart';
part 'labels_entity.g.dart';

@freezed
sealed class LabelsEntity with _$LabelsEntity {
  factory LabelsEntity.rootLabel({
    required L10nKey l10nKey,
    required L10nValue l10nValue,
    required int fileStartIndex,
    required int fileEndIndex,
    required FilePath filePath,
    required List<LabelsEntity> children,
  }) = LabelsEntityRootLabel;

  factory LabelsEntity.childLabel({
    required L10nKey l10nKey,
    required L10nValue l10nValue,
    required int parentStartIndex,
    required int parentEndIndex,
    required FilePath filePath,
    required List<LabelsEntity> children,
  }) = LabelsEntityChildLabel;

  factory LabelsEntity.labelDynamicValue({
    required String content,
    required int parentStartIndex,
    required int parentEndIndex,
    required FilePath filePath,
    required List<LabelsEntity> children,
  }) = LabelsEntityLabelDynamicValue;

  factory LabelsEntity.fromJson(Map<String, dynamic> map) =>
      _$LabelsEntityFromJson(map);
}
