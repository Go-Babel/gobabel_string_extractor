// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'labels_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
LabelsEntity _$LabelsEntityFromJson(
  Map<String, dynamic> json
) {
        switch (json['runtimeType']) {
                  case 'rootLabel':
          return LabelsEntityRootLabel.fromJson(
            json
          );
                case 'childLabel':
          return LabelsEntityChildLabel.fromJson(
            json
          );
                case 'labelDynamicValue':
          return LabelsEntityLabelDynamicValue.fromJson(
            json
          );
        
          default:
            throw CheckedFromJsonException(
  json,
  'runtimeType',
  'LabelsEntity',
  'Invalid union type "${json['runtimeType']}"!'
);
        }
      
}

/// @nodoc
mixin _$LabelsEntity {

 FilePath get filePath; List<LabelsEntity> get children;
/// Create a copy of LabelsEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LabelsEntityCopyWith<LabelsEntity> get copyWith => _$LabelsEntityCopyWithImpl<LabelsEntity>(this as LabelsEntity, _$identity);

  /// Serializes this LabelsEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LabelsEntity&&(identical(other.filePath, filePath) || other.filePath == filePath)&&const DeepCollectionEquality().equals(other.children, children));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,filePath,const DeepCollectionEquality().hash(children));

@override
String toString() {
  return 'LabelsEntity(filePath: $filePath, children: $children)';
}


}

/// @nodoc
abstract mixin class $LabelsEntityCopyWith<$Res>  {
  factory $LabelsEntityCopyWith(LabelsEntity value, $Res Function(LabelsEntity) _then) = _$LabelsEntityCopyWithImpl;
@useResult
$Res call({
 String filePath, List<LabelsEntity> children
});




}
/// @nodoc
class _$LabelsEntityCopyWithImpl<$Res>
    implements $LabelsEntityCopyWith<$Res> {
  _$LabelsEntityCopyWithImpl(this._self, this._then);

  final LabelsEntity _self;
  final $Res Function(LabelsEntity) _then;

/// Create a copy of LabelsEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? filePath = null,Object? children = null,}) {
  return _then(_self.copyWith(
filePath: null == filePath ? _self.filePath : filePath // ignore: cast_nullable_to_non_nullable
as String,children: null == children ? _self.children : children // ignore: cast_nullable_to_non_nullable
as List<LabelsEntity>,
  ));
}

}


/// @nodoc
@JsonSerializable()

class LabelsEntityRootLabel implements LabelsEntity {
   LabelsEntityRootLabel({required this.l10nKey, required this.l10nValue, required this.fileStartIndex, required this.fileEndIndex, required this.filePath, required final  List<LabelsEntity> children, final  String? $type}): _children = children,$type = $type ?? 'rootLabel';
  factory LabelsEntityRootLabel.fromJson(Map<String, dynamic> json) => _$LabelsEntityRootLabelFromJson(json);

 final  L10nKey l10nKey;
 final  L10nValue l10nValue;
 final  int fileStartIndex;
 final  int fileEndIndex;
@override final  FilePath filePath;
 final  List<LabelsEntity> _children;
@override List<LabelsEntity> get children {
  if (_children is EqualUnmodifiableListView) return _children;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_children);
}


@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of LabelsEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LabelsEntityRootLabelCopyWith<LabelsEntityRootLabel> get copyWith => _$LabelsEntityRootLabelCopyWithImpl<LabelsEntityRootLabel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LabelsEntityRootLabelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LabelsEntityRootLabel&&(identical(other.l10nKey, l10nKey) || other.l10nKey == l10nKey)&&(identical(other.l10nValue, l10nValue) || other.l10nValue == l10nValue)&&(identical(other.fileStartIndex, fileStartIndex) || other.fileStartIndex == fileStartIndex)&&(identical(other.fileEndIndex, fileEndIndex) || other.fileEndIndex == fileEndIndex)&&(identical(other.filePath, filePath) || other.filePath == filePath)&&const DeepCollectionEquality().equals(other._children, _children));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,l10nKey,l10nValue,fileStartIndex,fileEndIndex,filePath,const DeepCollectionEquality().hash(_children));

@override
String toString() {
  return 'LabelsEntity.rootLabel(l10nKey: $l10nKey, l10nValue: $l10nValue, fileStartIndex: $fileStartIndex, fileEndIndex: $fileEndIndex, filePath: $filePath, children: $children)';
}


}

/// @nodoc
abstract mixin class $LabelsEntityRootLabelCopyWith<$Res> implements $LabelsEntityCopyWith<$Res> {
  factory $LabelsEntityRootLabelCopyWith(LabelsEntityRootLabel value, $Res Function(LabelsEntityRootLabel) _then) = _$LabelsEntityRootLabelCopyWithImpl;
@override @useResult
$Res call({
 L10nKey l10nKey, L10nValue l10nValue, int fileStartIndex, int fileEndIndex, FilePath filePath, List<LabelsEntity> children
});




}
/// @nodoc
class _$LabelsEntityRootLabelCopyWithImpl<$Res>
    implements $LabelsEntityRootLabelCopyWith<$Res> {
  _$LabelsEntityRootLabelCopyWithImpl(this._self, this._then);

  final LabelsEntityRootLabel _self;
  final $Res Function(LabelsEntityRootLabel) _then;

/// Create a copy of LabelsEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? l10nKey = null,Object? l10nValue = null,Object? fileStartIndex = null,Object? fileEndIndex = null,Object? filePath = null,Object? children = null,}) {
  return _then(LabelsEntityRootLabel(
l10nKey: null == l10nKey ? _self.l10nKey : l10nKey // ignore: cast_nullable_to_non_nullable
as L10nKey,l10nValue: null == l10nValue ? _self.l10nValue : l10nValue // ignore: cast_nullable_to_non_nullable
as L10nValue,fileStartIndex: null == fileStartIndex ? _self.fileStartIndex : fileStartIndex // ignore: cast_nullable_to_non_nullable
as int,fileEndIndex: null == fileEndIndex ? _self.fileEndIndex : fileEndIndex // ignore: cast_nullable_to_non_nullable
as int,filePath: null == filePath ? _self.filePath : filePath // ignore: cast_nullable_to_non_nullable
as FilePath,children: null == children ? _self._children : children // ignore: cast_nullable_to_non_nullable
as List<LabelsEntity>,
  ));
}


}

/// @nodoc
@JsonSerializable()

class LabelsEntityChildLabel implements LabelsEntity {
   LabelsEntityChildLabel({required this.l10nKey, required this.l10nValue, required this.parentStartIndex, required this.parentEndIndex, required this.filePath, required final  List<LabelsEntity> children, final  String? $type}): _children = children,$type = $type ?? 'childLabel';
  factory LabelsEntityChildLabel.fromJson(Map<String, dynamic> json) => _$LabelsEntityChildLabelFromJson(json);

 final  L10nKey l10nKey;
 final  L10nValue l10nValue;
 final  int parentStartIndex;
 final  int parentEndIndex;
@override final  FilePath filePath;
 final  List<LabelsEntity> _children;
@override List<LabelsEntity> get children {
  if (_children is EqualUnmodifiableListView) return _children;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_children);
}


@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of LabelsEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LabelsEntityChildLabelCopyWith<LabelsEntityChildLabel> get copyWith => _$LabelsEntityChildLabelCopyWithImpl<LabelsEntityChildLabel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LabelsEntityChildLabelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LabelsEntityChildLabel&&(identical(other.l10nKey, l10nKey) || other.l10nKey == l10nKey)&&(identical(other.l10nValue, l10nValue) || other.l10nValue == l10nValue)&&(identical(other.parentStartIndex, parentStartIndex) || other.parentStartIndex == parentStartIndex)&&(identical(other.parentEndIndex, parentEndIndex) || other.parentEndIndex == parentEndIndex)&&(identical(other.filePath, filePath) || other.filePath == filePath)&&const DeepCollectionEquality().equals(other._children, _children));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,l10nKey,l10nValue,parentStartIndex,parentEndIndex,filePath,const DeepCollectionEquality().hash(_children));

@override
String toString() {
  return 'LabelsEntity.childLabel(l10nKey: $l10nKey, l10nValue: $l10nValue, parentStartIndex: $parentStartIndex, parentEndIndex: $parentEndIndex, filePath: $filePath, children: $children)';
}


}

/// @nodoc
abstract mixin class $LabelsEntityChildLabelCopyWith<$Res> implements $LabelsEntityCopyWith<$Res> {
  factory $LabelsEntityChildLabelCopyWith(LabelsEntityChildLabel value, $Res Function(LabelsEntityChildLabel) _then) = _$LabelsEntityChildLabelCopyWithImpl;
@override @useResult
$Res call({
 L10nKey l10nKey, L10nValue l10nValue, int parentStartIndex, int parentEndIndex, FilePath filePath, List<LabelsEntity> children
});




}
/// @nodoc
class _$LabelsEntityChildLabelCopyWithImpl<$Res>
    implements $LabelsEntityChildLabelCopyWith<$Res> {
  _$LabelsEntityChildLabelCopyWithImpl(this._self, this._then);

  final LabelsEntityChildLabel _self;
  final $Res Function(LabelsEntityChildLabel) _then;

/// Create a copy of LabelsEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? l10nKey = null,Object? l10nValue = null,Object? parentStartIndex = null,Object? parentEndIndex = null,Object? filePath = null,Object? children = null,}) {
  return _then(LabelsEntityChildLabel(
l10nKey: null == l10nKey ? _self.l10nKey : l10nKey // ignore: cast_nullable_to_non_nullable
as L10nKey,l10nValue: null == l10nValue ? _self.l10nValue : l10nValue // ignore: cast_nullable_to_non_nullable
as L10nValue,parentStartIndex: null == parentStartIndex ? _self.parentStartIndex : parentStartIndex // ignore: cast_nullable_to_non_nullable
as int,parentEndIndex: null == parentEndIndex ? _self.parentEndIndex : parentEndIndex // ignore: cast_nullable_to_non_nullable
as int,filePath: null == filePath ? _self.filePath : filePath // ignore: cast_nullable_to_non_nullable
as FilePath,children: null == children ? _self._children : children // ignore: cast_nullable_to_non_nullable
as List<LabelsEntity>,
  ));
}


}

/// @nodoc
@JsonSerializable()

class LabelsEntityLabelDynamicValue implements LabelsEntity {
   LabelsEntityLabelDynamicValue({required this.content, required this.parentStartIndex, required this.parentEndIndex, required this.filePath, required final  List<LabelsEntity> children, final  String? $type}): _children = children,$type = $type ?? 'labelDynamicValue';
  factory LabelsEntityLabelDynamicValue.fromJson(Map<String, dynamic> json) => _$LabelsEntityLabelDynamicValueFromJson(json);

 final  String content;
 final  int parentStartIndex;
 final  int parentEndIndex;
@override final  FilePath filePath;
 final  List<LabelsEntity> _children;
@override List<LabelsEntity> get children {
  if (_children is EqualUnmodifiableListView) return _children;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_children);
}


@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of LabelsEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LabelsEntityLabelDynamicValueCopyWith<LabelsEntityLabelDynamicValue> get copyWith => _$LabelsEntityLabelDynamicValueCopyWithImpl<LabelsEntityLabelDynamicValue>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LabelsEntityLabelDynamicValueToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LabelsEntityLabelDynamicValue&&(identical(other.content, content) || other.content == content)&&(identical(other.parentStartIndex, parentStartIndex) || other.parentStartIndex == parentStartIndex)&&(identical(other.parentEndIndex, parentEndIndex) || other.parentEndIndex == parentEndIndex)&&(identical(other.filePath, filePath) || other.filePath == filePath)&&const DeepCollectionEquality().equals(other._children, _children));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,content,parentStartIndex,parentEndIndex,filePath,const DeepCollectionEquality().hash(_children));

@override
String toString() {
  return 'LabelsEntity.labelDynamicValue(content: $content, parentStartIndex: $parentStartIndex, parentEndIndex: $parentEndIndex, filePath: $filePath, children: $children)';
}


}

/// @nodoc
abstract mixin class $LabelsEntityLabelDynamicValueCopyWith<$Res> implements $LabelsEntityCopyWith<$Res> {
  factory $LabelsEntityLabelDynamicValueCopyWith(LabelsEntityLabelDynamicValue value, $Res Function(LabelsEntityLabelDynamicValue) _then) = _$LabelsEntityLabelDynamicValueCopyWithImpl;
@override @useResult
$Res call({
 String content, int parentStartIndex, int parentEndIndex, FilePath filePath, List<LabelsEntity> children
});




}
/// @nodoc
class _$LabelsEntityLabelDynamicValueCopyWithImpl<$Res>
    implements $LabelsEntityLabelDynamicValueCopyWith<$Res> {
  _$LabelsEntityLabelDynamicValueCopyWithImpl(this._self, this._then);

  final LabelsEntityLabelDynamicValue _self;
  final $Res Function(LabelsEntityLabelDynamicValue) _then;

/// Create a copy of LabelsEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? content = null,Object? parentStartIndex = null,Object? parentEndIndex = null,Object? filePath = null,Object? children = null,}) {
  return _then(LabelsEntityLabelDynamicValue(
content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,parentStartIndex: null == parentStartIndex ? _self.parentStartIndex : parentStartIndex // ignore: cast_nullable_to_non_nullable
as int,parentEndIndex: null == parentEndIndex ? _self.parentEndIndex : parentEndIndex // ignore: cast_nullable_to_non_nullable
as int,filePath: null == filePath ? _self.filePath : filePath // ignore: cast_nullable_to_non_nullable
as FilePath,children: null == children ? _self._children : children // ignore: cast_nullable_to_non_nullable
as List<LabelsEntity>,
  ));
}


}

// dart format on
