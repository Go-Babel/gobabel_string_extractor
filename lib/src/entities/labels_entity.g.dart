// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'labels_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LabelsEntityRootLabel _$LabelsEntityRootLabelFromJson(
  Map<String, dynamic> json,
) => LabelsEntityRootLabel(
  l10nKey: json['l10nKey'] as String,
  l10nValue: json['l10nValue'] as String,
  fileStartIndex: (json['fileStartIndex'] as num).toInt(),
  fileEndIndex: (json['fileEndIndex'] as num).toInt(),
  filePath: json['filePath'] as String,
  children: (json['children'] as List<dynamic>)
      .map((e) => LabelsEntity.fromJson(e as Map<String, dynamic>))
      .toList(),
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$LabelsEntityRootLabelToJson(
  LabelsEntityRootLabel instance,
) => <String, dynamic>{
  'l10nKey': instance.l10nKey,
  'l10nValue': instance.l10nValue,
  'fileStartIndex': instance.fileStartIndex,
  'fileEndIndex': instance.fileEndIndex,
  'filePath': instance.filePath,
  'children': instance.children,
  'runtimeType': instance.$type,
};

LabelsEntityChildLabel _$LabelsEntityChildLabelFromJson(
  Map<String, dynamic> json,
) => LabelsEntityChildLabel(
  l10nKey: json['l10nKey'] as String,
  l10nValue: json['l10nValue'] as String,
  parentStartIndex: (json['parentStartIndex'] as num).toInt(),
  parentEndIndex: (json['parentEndIndex'] as num).toInt(),
  filePath: json['filePath'] as String,
  children: (json['children'] as List<dynamic>)
      .map((e) => LabelsEntity.fromJson(e as Map<String, dynamic>))
      .toList(),
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$LabelsEntityChildLabelToJson(
  LabelsEntityChildLabel instance,
) => <String, dynamic>{
  'l10nKey': instance.l10nKey,
  'l10nValue': instance.l10nValue,
  'parentStartIndex': instance.parentStartIndex,
  'parentEndIndex': instance.parentEndIndex,
  'filePath': instance.filePath,
  'children': instance.children,
  'runtimeType': instance.$type,
};

LabelsEntityLabelDynamicValue _$LabelsEntityLabelDynamicValueFromJson(
  Map<String, dynamic> json,
) => LabelsEntityLabelDynamicValue(
  content: json['content'] as String,
  parentStartIndex: (json['parentStartIndex'] as num).toInt(),
  parentEndIndex: (json['parentEndIndex'] as num).toInt(),
  filePath: json['filePath'] as String,
  children: (json['children'] as List<dynamic>)
      .map((e) => LabelsEntity.fromJson(e as Map<String, dynamic>))
      .toList(),
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$LabelsEntityLabelDynamicValueToJson(
  LabelsEntityLabelDynamicValue instance,
) => <String, dynamic>{
  'content': instance.content,
  'parentStartIndex': instance.parentStartIndex,
  'parentEndIndex': instance.parentEndIndex,
  'filePath': instance.filePath,
  'children': instance.children,
  'runtimeType': instance.$type,
};
