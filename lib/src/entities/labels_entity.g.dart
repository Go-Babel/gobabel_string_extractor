// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'labels_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LabelsEntityRootLabelImpl _$$LabelsEntityRootLabelImplFromJson(
  Map<String, dynamic> json,
) => _$LabelsEntityRootLabelImpl(
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

Map<String, dynamic> _$$LabelsEntityRootLabelImplToJson(
  _$LabelsEntityRootLabelImpl instance,
) => <String, dynamic>{
  'l10nKey': instance.l10nKey,
  'l10nValue': instance.l10nValue,
  'fileStartIndex': instance.fileStartIndex,
  'fileEndIndex': instance.fileEndIndex,
  'filePath': instance.filePath,
  'children': instance.children,
  'runtimeType': instance.$type,
};

_$LabelsEntityChildLabelImpl _$$LabelsEntityChildLabelImplFromJson(
  Map<String, dynamic> json,
) => _$LabelsEntityChildLabelImpl(
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

Map<String, dynamic> _$$LabelsEntityChildLabelImplToJson(
  _$LabelsEntityChildLabelImpl instance,
) => <String, dynamic>{
  'l10nKey': instance.l10nKey,
  'l10nValue': instance.l10nValue,
  'parentStartIndex': instance.parentStartIndex,
  'parentEndIndex': instance.parentEndIndex,
  'filePath': instance.filePath,
  'children': instance.children,
  'runtimeType': instance.$type,
};

_$LabelsEntityLabelDynamicValueImpl
_$$LabelsEntityLabelDynamicValueImplFromJson(Map<String, dynamic> json) =>
    _$LabelsEntityLabelDynamicValueImpl(
      content: json['content'] as String,
      parentStartIndex: (json['parentStartIndex'] as num).toInt(),
      parentEndIndex: (json['parentEndIndex'] as num).toInt(),
      filePath: json['filePath'] as String,
      children: (json['children'] as List<dynamic>)
          .map((e) => LabelsEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$LabelsEntityLabelDynamicValueImplToJson(
  _$LabelsEntityLabelDynamicValueImpl instance,
) => <String, dynamic>{
  'content': instance.content,
  'parentStartIndex': instance.parentStartIndex,
  'parentEndIndex': instance.parentEndIndex,
  'filePath': instance.filePath,
  'children': instance.children,
  'runtimeType': instance.$type,
};
