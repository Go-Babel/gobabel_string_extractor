// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'babel_label_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BabelLabelEntity {

 String get filePath; List<LabelsEntity> get children;
/// Create a copy of BabelLabelEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BabelLabelEntityCopyWith<BabelLabelEntity> get copyWith => _$BabelLabelEntityCopyWithImpl<BabelLabelEntity>(this as BabelLabelEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BabelLabelEntity&&(identical(other.filePath, filePath) || other.filePath == filePath)&&const DeepCollectionEquality().equals(other.children, children));
}


@override
int get hashCode => Object.hash(runtimeType,filePath,const DeepCollectionEquality().hash(children));

@override
String toString() {
  return 'BabelLabelEntity(filePath: $filePath, children: $children)';
}


}

/// @nodoc
abstract mixin class $BabelLabelEntityCopyWith<$Res>  {
  factory $BabelLabelEntityCopyWith(BabelLabelEntity value, $Res Function(BabelLabelEntity) _then) = _$BabelLabelEntityCopyWithImpl;
@useResult
$Res call({
 String filePath, List<LabelsEntity> children
});




}
/// @nodoc
class _$BabelLabelEntityCopyWithImpl<$Res>
    implements $BabelLabelEntityCopyWith<$Res> {
  _$BabelLabelEntityCopyWithImpl(this._self, this._then);

  final BabelLabelEntity _self;
  final $Res Function(BabelLabelEntity) _then;

/// Create a copy of BabelLabelEntity
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


class BabelLabelEntityRootLabel implements BabelLabelEntity {
   BabelLabelEntityRootLabel({required this.l10nKey, required this.l10nValue, required this.babelFunctionDeclaration, required this.babelFunctionImplementation, required this.fileStartIndex, required this.fileEndIndex, required this.filePath, required final  List<LabelsEntity> children}): _children = children;
  

 final  L10nKey l10nKey;
 final  L10nValue l10nValue;
 final  BabelFunctionDeclaration babelFunctionDeclaration;
 final  BabelFunctionImplementation babelFunctionImplementation;
 final  int fileStartIndex;
 final  int fileEndIndex;
@override final  String filePath;
 final  List<LabelsEntity> _children;
@override List<LabelsEntity> get children {
  if (_children is EqualUnmodifiableListView) return _children;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_children);
}


/// Create a copy of BabelLabelEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BabelLabelEntityRootLabelCopyWith<BabelLabelEntityRootLabel> get copyWith => _$BabelLabelEntityRootLabelCopyWithImpl<BabelLabelEntityRootLabel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BabelLabelEntityRootLabel&&(identical(other.l10nKey, l10nKey) || other.l10nKey == l10nKey)&&(identical(other.l10nValue, l10nValue) || other.l10nValue == l10nValue)&&(identical(other.babelFunctionDeclaration, babelFunctionDeclaration) || other.babelFunctionDeclaration == babelFunctionDeclaration)&&(identical(other.babelFunctionImplementation, babelFunctionImplementation) || other.babelFunctionImplementation == babelFunctionImplementation)&&(identical(other.fileStartIndex, fileStartIndex) || other.fileStartIndex == fileStartIndex)&&(identical(other.fileEndIndex, fileEndIndex) || other.fileEndIndex == fileEndIndex)&&(identical(other.filePath, filePath) || other.filePath == filePath)&&const DeepCollectionEquality().equals(other._children, _children));
}


@override
int get hashCode => Object.hash(runtimeType,l10nKey,l10nValue,babelFunctionDeclaration,babelFunctionImplementation,fileStartIndex,fileEndIndex,filePath,const DeepCollectionEquality().hash(_children));

@override
String toString() {
  return 'BabelLabelEntity.rootLabel(l10nKey: $l10nKey, l10nValue: $l10nValue, babelFunctionDeclaration: $babelFunctionDeclaration, babelFunctionImplementation: $babelFunctionImplementation, fileStartIndex: $fileStartIndex, fileEndIndex: $fileEndIndex, filePath: $filePath, children: $children)';
}


}

/// @nodoc
abstract mixin class $BabelLabelEntityRootLabelCopyWith<$Res> implements $BabelLabelEntityCopyWith<$Res> {
  factory $BabelLabelEntityRootLabelCopyWith(BabelLabelEntityRootLabel value, $Res Function(BabelLabelEntityRootLabel) _then) = _$BabelLabelEntityRootLabelCopyWithImpl;
@override @useResult
$Res call({
 L10nKey l10nKey, L10nValue l10nValue, BabelFunctionDeclaration babelFunctionDeclaration, BabelFunctionImplementation babelFunctionImplementation, int fileStartIndex, int fileEndIndex, String filePath, List<LabelsEntity> children
});




}
/// @nodoc
class _$BabelLabelEntityRootLabelCopyWithImpl<$Res>
    implements $BabelLabelEntityRootLabelCopyWith<$Res> {
  _$BabelLabelEntityRootLabelCopyWithImpl(this._self, this._then);

  final BabelLabelEntityRootLabel _self;
  final $Res Function(BabelLabelEntityRootLabel) _then;

/// Create a copy of BabelLabelEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? l10nKey = null,Object? l10nValue = null,Object? babelFunctionDeclaration = null,Object? babelFunctionImplementation = null,Object? fileStartIndex = null,Object? fileEndIndex = null,Object? filePath = null,Object? children = null,}) {
  return _then(BabelLabelEntityRootLabel(
l10nKey: null == l10nKey ? _self.l10nKey : l10nKey // ignore: cast_nullable_to_non_nullable
as L10nKey,l10nValue: null == l10nValue ? _self.l10nValue : l10nValue // ignore: cast_nullable_to_non_nullable
as L10nValue,babelFunctionDeclaration: null == babelFunctionDeclaration ? _self.babelFunctionDeclaration : babelFunctionDeclaration // ignore: cast_nullable_to_non_nullable
as BabelFunctionDeclaration,babelFunctionImplementation: null == babelFunctionImplementation ? _self.babelFunctionImplementation : babelFunctionImplementation // ignore: cast_nullable_to_non_nullable
as BabelFunctionImplementation,fileStartIndex: null == fileStartIndex ? _self.fileStartIndex : fileStartIndex // ignore: cast_nullable_to_non_nullable
as int,fileEndIndex: null == fileEndIndex ? _self.fileEndIndex : fileEndIndex // ignore: cast_nullable_to_non_nullable
as int,filePath: null == filePath ? _self.filePath : filePath // ignore: cast_nullable_to_non_nullable
as String,children: null == children ? _self._children : children // ignore: cast_nullable_to_non_nullable
as List<LabelsEntity>,
  ));
}


}

/// @nodoc


class BabelLabelEntityChildLabel implements BabelLabelEntity {
   BabelLabelEntityChildLabel({required this.l10nKey, required this.l10nValue, required this.babelFunctionDeclaration, required this.babelFunctionImplementation, required this.parentStartIndex, required this.parentEndIndex, required this.filePath, required final  List<LabelsEntity> children}): _children = children;
  

 final  L10nKey l10nKey;
 final  L10nValue l10nValue;
 final  BabelFunctionDeclaration babelFunctionDeclaration;
 final  BabelFunctionImplementation babelFunctionImplementation;
 final  int parentStartIndex;
 final  int parentEndIndex;
@override final  String filePath;
 final  List<LabelsEntity> _children;
@override List<LabelsEntity> get children {
  if (_children is EqualUnmodifiableListView) return _children;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_children);
}


/// Create a copy of BabelLabelEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BabelLabelEntityChildLabelCopyWith<BabelLabelEntityChildLabel> get copyWith => _$BabelLabelEntityChildLabelCopyWithImpl<BabelLabelEntityChildLabel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BabelLabelEntityChildLabel&&(identical(other.l10nKey, l10nKey) || other.l10nKey == l10nKey)&&(identical(other.l10nValue, l10nValue) || other.l10nValue == l10nValue)&&(identical(other.babelFunctionDeclaration, babelFunctionDeclaration) || other.babelFunctionDeclaration == babelFunctionDeclaration)&&(identical(other.babelFunctionImplementation, babelFunctionImplementation) || other.babelFunctionImplementation == babelFunctionImplementation)&&(identical(other.parentStartIndex, parentStartIndex) || other.parentStartIndex == parentStartIndex)&&(identical(other.parentEndIndex, parentEndIndex) || other.parentEndIndex == parentEndIndex)&&(identical(other.filePath, filePath) || other.filePath == filePath)&&const DeepCollectionEquality().equals(other._children, _children));
}


@override
int get hashCode => Object.hash(runtimeType,l10nKey,l10nValue,babelFunctionDeclaration,babelFunctionImplementation,parentStartIndex,parentEndIndex,filePath,const DeepCollectionEquality().hash(_children));

@override
String toString() {
  return 'BabelLabelEntity.childLabel(l10nKey: $l10nKey, l10nValue: $l10nValue, babelFunctionDeclaration: $babelFunctionDeclaration, babelFunctionImplementation: $babelFunctionImplementation, parentStartIndex: $parentStartIndex, parentEndIndex: $parentEndIndex, filePath: $filePath, children: $children)';
}


}

/// @nodoc
abstract mixin class $BabelLabelEntityChildLabelCopyWith<$Res> implements $BabelLabelEntityCopyWith<$Res> {
  factory $BabelLabelEntityChildLabelCopyWith(BabelLabelEntityChildLabel value, $Res Function(BabelLabelEntityChildLabel) _then) = _$BabelLabelEntityChildLabelCopyWithImpl;
@override @useResult
$Res call({
 L10nKey l10nKey, L10nValue l10nValue, BabelFunctionDeclaration babelFunctionDeclaration, BabelFunctionImplementation babelFunctionImplementation, int parentStartIndex, int parentEndIndex, String filePath, List<LabelsEntity> children
});




}
/// @nodoc
class _$BabelLabelEntityChildLabelCopyWithImpl<$Res>
    implements $BabelLabelEntityChildLabelCopyWith<$Res> {
  _$BabelLabelEntityChildLabelCopyWithImpl(this._self, this._then);

  final BabelLabelEntityChildLabel _self;
  final $Res Function(BabelLabelEntityChildLabel) _then;

/// Create a copy of BabelLabelEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? l10nKey = null,Object? l10nValue = null,Object? babelFunctionDeclaration = null,Object? babelFunctionImplementation = null,Object? parentStartIndex = null,Object? parentEndIndex = null,Object? filePath = null,Object? children = null,}) {
  return _then(BabelLabelEntityChildLabel(
l10nKey: null == l10nKey ? _self.l10nKey : l10nKey // ignore: cast_nullable_to_non_nullable
as L10nKey,l10nValue: null == l10nValue ? _self.l10nValue : l10nValue // ignore: cast_nullable_to_non_nullable
as L10nValue,babelFunctionDeclaration: null == babelFunctionDeclaration ? _self.babelFunctionDeclaration : babelFunctionDeclaration // ignore: cast_nullable_to_non_nullable
as BabelFunctionDeclaration,babelFunctionImplementation: null == babelFunctionImplementation ? _self.babelFunctionImplementation : babelFunctionImplementation // ignore: cast_nullable_to_non_nullable
as BabelFunctionImplementation,parentStartIndex: null == parentStartIndex ? _self.parentStartIndex : parentStartIndex // ignore: cast_nullable_to_non_nullable
as int,parentEndIndex: null == parentEndIndex ? _self.parentEndIndex : parentEndIndex // ignore: cast_nullable_to_non_nullable
as int,filePath: null == filePath ? _self.filePath : filePath // ignore: cast_nullable_to_non_nullable
as String,children: null == children ? _self._children : children // ignore: cast_nullable_to_non_nullable
as List<LabelsEntity>,
  ));
}


}

/// @nodoc


class BabelLabelEntityLabelDynamicValue implements BabelLabelEntity {
   BabelLabelEntityLabelDynamicValue({required this.content, required this.parentStartIndex, required this.parentEndIndex, required this.filePath, required final  List<LabelsEntity> children}): _children = children;
  

 final  String content;
 final  int parentStartIndex;
 final  int parentEndIndex;
@override final  String filePath;
 final  List<LabelsEntity> _children;
@override List<LabelsEntity> get children {
  if (_children is EqualUnmodifiableListView) return _children;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_children);
}


/// Create a copy of BabelLabelEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BabelLabelEntityLabelDynamicValueCopyWith<BabelLabelEntityLabelDynamicValue> get copyWith => _$BabelLabelEntityLabelDynamicValueCopyWithImpl<BabelLabelEntityLabelDynamicValue>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BabelLabelEntityLabelDynamicValue&&(identical(other.content, content) || other.content == content)&&(identical(other.parentStartIndex, parentStartIndex) || other.parentStartIndex == parentStartIndex)&&(identical(other.parentEndIndex, parentEndIndex) || other.parentEndIndex == parentEndIndex)&&(identical(other.filePath, filePath) || other.filePath == filePath)&&const DeepCollectionEquality().equals(other._children, _children));
}


@override
int get hashCode => Object.hash(runtimeType,content,parentStartIndex,parentEndIndex,filePath,const DeepCollectionEquality().hash(_children));

@override
String toString() {
  return 'BabelLabelEntity.labelDynamicValue(content: $content, parentStartIndex: $parentStartIndex, parentEndIndex: $parentEndIndex, filePath: $filePath, children: $children)';
}


}

/// @nodoc
abstract mixin class $BabelLabelEntityLabelDynamicValueCopyWith<$Res> implements $BabelLabelEntityCopyWith<$Res> {
  factory $BabelLabelEntityLabelDynamicValueCopyWith(BabelLabelEntityLabelDynamicValue value, $Res Function(BabelLabelEntityLabelDynamicValue) _then) = _$BabelLabelEntityLabelDynamicValueCopyWithImpl;
@override @useResult
$Res call({
 String content, int parentStartIndex, int parentEndIndex, String filePath, List<LabelsEntity> children
});




}
/// @nodoc
class _$BabelLabelEntityLabelDynamicValueCopyWithImpl<$Res>
    implements $BabelLabelEntityLabelDynamicValueCopyWith<$Res> {
  _$BabelLabelEntityLabelDynamicValueCopyWithImpl(this._self, this._then);

  final BabelLabelEntityLabelDynamicValue _self;
  final $Res Function(BabelLabelEntityLabelDynamicValue) _then;

/// Create a copy of BabelLabelEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? content = null,Object? parentStartIndex = null,Object? parentEndIndex = null,Object? filePath = null,Object? children = null,}) {
  return _then(BabelLabelEntityLabelDynamicValue(
content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,parentStartIndex: null == parentStartIndex ? _self.parentStartIndex : parentStartIndex // ignore: cast_nullable_to_non_nullable
as int,parentEndIndex: null == parentEndIndex ? _self.parentEndIndex : parentEndIndex // ignore: cast_nullable_to_non_nullable
as int,filePath: null == filePath ? _self.filePath : filePath // ignore: cast_nullable_to_non_nullable
as String,children: null == children ? _self._children : children // ignore: cast_nullable_to_non_nullable
as List<LabelsEntity>,
  ));
}


}

// dart format on
