// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'babel_label_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BabelLabelEntityRootLabelImpl _$$BabelLabelEntityRootLabelImplFromJson(
  Map<String, dynamic> json,
) => _$BabelLabelEntityRootLabelImpl(
  l10nKey: json['l10nKey'] as String,
  l10nValue: json['l10nValue'] as String,
  babelFunctionDeclaration: json['babelFunctionDeclaration'] as String,
  babelFunctionImplementation: json['babelFunctionImplementation'] as String,
  fileStartIndex: (json['fileStartIndex'] as num).toInt(),
  fileEndIndex: (json['fileEndIndex'] as num).toInt(),
  filePath: json['filePath'] as String,
  children: (json['children'] as List<dynamic>)
      .map((e) => BabelLabelEntity.fromJson(e as Map<String, dynamic>))
      .toList(),
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$$BabelLabelEntityRootLabelImplToJson(
  _$BabelLabelEntityRootLabelImpl instance,
) => <String, dynamic>{
  'l10nKey': instance.l10nKey,
  'l10nValue': instance.l10nValue,
  'babelFunctionDeclaration': instance.babelFunctionDeclaration,
  'babelFunctionImplementation': instance.babelFunctionImplementation,
  'fileStartIndex': instance.fileStartIndex,
  'fileEndIndex': instance.fileEndIndex,
  'filePath': instance.filePath,
  'children': instance.children,
  'runtimeType': instance.$type,
};

_$BabelLabelEntityChildLabelImpl _$$BabelLabelEntityChildLabelImplFromJson(
  Map<String, dynamic> json,
) => _$BabelLabelEntityChildLabelImpl(
  l10nKey: json['l10nKey'] as String,
  l10nValue: json['l10nValue'] as String,
  babelFunctionDeclaration: json['babelFunctionDeclaration'] as String,
  babelFunctionImplementation: json['babelFunctionImplementation'] as String,
  parentStartIndex: (json['parentStartIndex'] as num).toInt(),
  parentEndIndex: (json['parentEndIndex'] as num).toInt(),
  children: (json['children'] as List<dynamic>)
      .map((e) => BabelLabelEntity.fromJson(e as Map<String, dynamic>))
      .toList(),
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$$BabelLabelEntityChildLabelImplToJson(
  _$BabelLabelEntityChildLabelImpl instance,
) => <String, dynamic>{
  'l10nKey': instance.l10nKey,
  'l10nValue': instance.l10nValue,
  'babelFunctionDeclaration': instance.babelFunctionDeclaration,
  'babelFunctionImplementation': instance.babelFunctionImplementation,
  'parentStartIndex': instance.parentStartIndex,
  'parentEndIndex': instance.parentEndIndex,
  'children': instance.children,
  'runtimeType': instance.$type,
};

_$BabelLabelEntityLabelDynamicValueImpl
_$$BabelLabelEntityLabelDynamicValueImplFromJson(Map<String, dynamic> json) =>
    _$BabelLabelEntityLabelDynamicValueImpl(
      content: json['content'] as String,
      parentStartIndex: (json['parentStartIndex'] as num).toInt(),
      parentEndIndex: (json['parentEndIndex'] as num).toInt(),
      children: (json['children'] as List<dynamic>)
          .map((e) => BabelLabelEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$BabelLabelEntityLabelDynamicValueImplToJson(
  _$BabelLabelEntityLabelDynamicValueImpl instance,
) => <String, dynamic>{
  'content': instance.content,
  'parentStartIndex': instance.parentStartIndex,
  'parentEndIndex': instance.parentEndIndex,
  'children': instance.children,
  'runtimeType': instance.$type,
};
