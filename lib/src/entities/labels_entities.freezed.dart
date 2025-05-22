// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'labels_entities.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LabelsEntities {

 List<LabelsEntities> get children;
/// Create a copy of LabelsEntities
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LabelsEntitiesCopyWith<LabelsEntities> get copyWith => _$LabelsEntitiesCopyWithImpl<LabelsEntities>(this as LabelsEntities, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LabelsEntities&&const DeepCollectionEquality().equals(other.children, children));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(children));

@override
String toString() {
  return 'LabelsEntities(children: $children)';
}


}

/// @nodoc
abstract mixin class $LabelsEntitiesCopyWith<$Res>  {
  factory $LabelsEntitiesCopyWith(LabelsEntities value, $Res Function(LabelsEntities) _then) = _$LabelsEntitiesCopyWithImpl;
@useResult
$Res call({
 List<LabelsEntities> children
});




}
/// @nodoc
class _$LabelsEntitiesCopyWithImpl<$Res>
    implements $LabelsEntitiesCopyWith<$Res> {
  _$LabelsEntitiesCopyWithImpl(this._self, this._then);

  final LabelsEntities _self;
  final $Res Function(LabelsEntities) _then;

/// Create a copy of LabelsEntities
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? children = null,}) {
  return _then(_self.copyWith(
children: null == children ? _self.children : children // ignore: cast_nullable_to_non_nullable
as List<LabelsEntities>,
  ));
}

}


/// @nodoc


class LabelsEntitiesRootLabel implements LabelsEntities {
   LabelsEntitiesRootLabel({required this.l10nKey, required this.l10nValue, required this.babelFunctionDeclaration, required this.babelFunctionImplementation, required this.fileStartIndex, required this.fileEndIndex, required final  List<LabelsEntities> children}): _children = children;
  

 final  L10nKey l10nKey;
 final  L10nValue l10nValue;
 final  BabelFunctionDeclaration babelFunctionDeclaration;
 final  BabelFunctionImplementation babelFunctionImplementation;
 final  int fileStartIndex;
 final  int fileEndIndex;
 final  List<LabelsEntities> _children;
@override List<LabelsEntities> get children {
  if (_children is EqualUnmodifiableListView) return _children;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_children);
}


/// Create a copy of LabelsEntities
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LabelsEntitiesRootLabelCopyWith<LabelsEntitiesRootLabel> get copyWith => _$LabelsEntitiesRootLabelCopyWithImpl<LabelsEntitiesRootLabel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LabelsEntitiesRootLabel&&(identical(other.l10nKey, l10nKey) || other.l10nKey == l10nKey)&&(identical(other.l10nValue, l10nValue) || other.l10nValue == l10nValue)&&(identical(other.babelFunctionDeclaration, babelFunctionDeclaration) || other.babelFunctionDeclaration == babelFunctionDeclaration)&&(identical(other.babelFunctionImplementation, babelFunctionImplementation) || other.babelFunctionImplementation == babelFunctionImplementation)&&(identical(other.fileStartIndex, fileStartIndex) || other.fileStartIndex == fileStartIndex)&&(identical(other.fileEndIndex, fileEndIndex) || other.fileEndIndex == fileEndIndex)&&const DeepCollectionEquality().equals(other._children, _children));
}


@override
int get hashCode => Object.hash(runtimeType,l10nKey,l10nValue,babelFunctionDeclaration,babelFunctionImplementation,fileStartIndex,fileEndIndex,const DeepCollectionEquality().hash(_children));

@override
String toString() {
  return 'LabelsEntities.rootLabel(l10nKey: $l10nKey, l10nValue: $l10nValue, babelFunctionDeclaration: $babelFunctionDeclaration, babelFunctionImplementation: $babelFunctionImplementation, fileStartIndex: $fileStartIndex, fileEndIndex: $fileEndIndex, children: $children)';
}


}

/// @nodoc
abstract mixin class $LabelsEntitiesRootLabelCopyWith<$Res> implements $LabelsEntitiesCopyWith<$Res> {
  factory $LabelsEntitiesRootLabelCopyWith(LabelsEntitiesRootLabel value, $Res Function(LabelsEntitiesRootLabel) _then) = _$LabelsEntitiesRootLabelCopyWithImpl;
@override @useResult
$Res call({
 L10nKey l10nKey, L10nValue l10nValue, BabelFunctionDeclaration babelFunctionDeclaration, BabelFunctionImplementation babelFunctionImplementation, int fileStartIndex, int fileEndIndex, List<LabelsEntities> children
});




}
/// @nodoc
class _$LabelsEntitiesRootLabelCopyWithImpl<$Res>
    implements $LabelsEntitiesRootLabelCopyWith<$Res> {
  _$LabelsEntitiesRootLabelCopyWithImpl(this._self, this._then);

  final LabelsEntitiesRootLabel _self;
  final $Res Function(LabelsEntitiesRootLabel) _then;

/// Create a copy of LabelsEntities
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? l10nKey = null,Object? l10nValue = null,Object? babelFunctionDeclaration = null,Object? babelFunctionImplementation = null,Object? fileStartIndex = null,Object? fileEndIndex = null,Object? children = null,}) {
  return _then(LabelsEntitiesRootLabel(
l10nKey: null == l10nKey ? _self.l10nKey : l10nKey // ignore: cast_nullable_to_non_nullable
as L10nKey,l10nValue: null == l10nValue ? _self.l10nValue : l10nValue // ignore: cast_nullable_to_non_nullable
as L10nValue,babelFunctionDeclaration: null == babelFunctionDeclaration ? _self.babelFunctionDeclaration : babelFunctionDeclaration // ignore: cast_nullable_to_non_nullable
as BabelFunctionDeclaration,babelFunctionImplementation: null == babelFunctionImplementation ? _self.babelFunctionImplementation : babelFunctionImplementation // ignore: cast_nullable_to_non_nullable
as BabelFunctionImplementation,fileStartIndex: null == fileStartIndex ? _self.fileStartIndex : fileStartIndex // ignore: cast_nullable_to_non_nullable
as int,fileEndIndex: null == fileEndIndex ? _self.fileEndIndex : fileEndIndex // ignore: cast_nullable_to_non_nullable
as int,children: null == children ? _self._children : children // ignore: cast_nullable_to_non_nullable
as List<LabelsEntities>,
  ));
}


}

/// @nodoc


class LabelsEntitiesChildLabel implements LabelsEntities {
   LabelsEntitiesChildLabel({required this.l10nKey, required this.l10nValue, required this.babelFunctionDeclaration, required this.babelFunctionImplementation, required this.parentStartIndex, required this.parentEndIndex, required final  List<LabelsEntities> children}): _children = children;
  

 final  L10nKey l10nKey;
 final  L10nValue l10nValue;
 final  BabelFunctionDeclaration babelFunctionDeclaration;
 final  BabelFunctionImplementation babelFunctionImplementation;
 final  int parentStartIndex;
 final  int parentEndIndex;
 final  List<LabelsEntities> _children;
@override List<LabelsEntities> get children {
  if (_children is EqualUnmodifiableListView) return _children;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_children);
}


/// Create a copy of LabelsEntities
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LabelsEntitiesChildLabelCopyWith<LabelsEntitiesChildLabel> get copyWith => _$LabelsEntitiesChildLabelCopyWithImpl<LabelsEntitiesChildLabel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LabelsEntitiesChildLabel&&(identical(other.l10nKey, l10nKey) || other.l10nKey == l10nKey)&&(identical(other.l10nValue, l10nValue) || other.l10nValue == l10nValue)&&(identical(other.babelFunctionDeclaration, babelFunctionDeclaration) || other.babelFunctionDeclaration == babelFunctionDeclaration)&&(identical(other.babelFunctionImplementation, babelFunctionImplementation) || other.babelFunctionImplementation == babelFunctionImplementation)&&(identical(other.parentStartIndex, parentStartIndex) || other.parentStartIndex == parentStartIndex)&&(identical(other.parentEndIndex, parentEndIndex) || other.parentEndIndex == parentEndIndex)&&const DeepCollectionEquality().equals(other._children, _children));
}


@override
int get hashCode => Object.hash(runtimeType,l10nKey,l10nValue,babelFunctionDeclaration,babelFunctionImplementation,parentStartIndex,parentEndIndex,const DeepCollectionEquality().hash(_children));

@override
String toString() {
  return 'LabelsEntities.childLabel(l10nKey: $l10nKey, l10nValue: $l10nValue, babelFunctionDeclaration: $babelFunctionDeclaration, babelFunctionImplementation: $babelFunctionImplementation, parentStartIndex: $parentStartIndex, parentEndIndex: $parentEndIndex, children: $children)';
}


}

/// @nodoc
abstract mixin class $LabelsEntitiesChildLabelCopyWith<$Res> implements $LabelsEntitiesCopyWith<$Res> {
  factory $LabelsEntitiesChildLabelCopyWith(LabelsEntitiesChildLabel value, $Res Function(LabelsEntitiesChildLabel) _then) = _$LabelsEntitiesChildLabelCopyWithImpl;
@override @useResult
$Res call({
 L10nKey l10nKey, L10nValue l10nValue, BabelFunctionDeclaration babelFunctionDeclaration, BabelFunctionImplementation babelFunctionImplementation, int parentStartIndex, int parentEndIndex, List<LabelsEntities> children
});




}
/// @nodoc
class _$LabelsEntitiesChildLabelCopyWithImpl<$Res>
    implements $LabelsEntitiesChildLabelCopyWith<$Res> {
  _$LabelsEntitiesChildLabelCopyWithImpl(this._self, this._then);

  final LabelsEntitiesChildLabel _self;
  final $Res Function(LabelsEntitiesChildLabel) _then;

/// Create a copy of LabelsEntities
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? l10nKey = null,Object? l10nValue = null,Object? babelFunctionDeclaration = null,Object? babelFunctionImplementation = null,Object? parentStartIndex = null,Object? parentEndIndex = null,Object? children = null,}) {
  return _then(LabelsEntitiesChildLabel(
l10nKey: null == l10nKey ? _self.l10nKey : l10nKey // ignore: cast_nullable_to_non_nullable
as L10nKey,l10nValue: null == l10nValue ? _self.l10nValue : l10nValue // ignore: cast_nullable_to_non_nullable
as L10nValue,babelFunctionDeclaration: null == babelFunctionDeclaration ? _self.babelFunctionDeclaration : babelFunctionDeclaration // ignore: cast_nullable_to_non_nullable
as BabelFunctionDeclaration,babelFunctionImplementation: null == babelFunctionImplementation ? _self.babelFunctionImplementation : babelFunctionImplementation // ignore: cast_nullable_to_non_nullable
as BabelFunctionImplementation,parentStartIndex: null == parentStartIndex ? _self.parentStartIndex : parentStartIndex // ignore: cast_nullable_to_non_nullable
as int,parentEndIndex: null == parentEndIndex ? _self.parentEndIndex : parentEndIndex // ignore: cast_nullable_to_non_nullable
as int,children: null == children ? _self._children : children // ignore: cast_nullable_to_non_nullable
as List<LabelsEntities>,
  ));
}


}

/// @nodoc


class LabelsEntitiesLabelDynamicValue implements LabelsEntities {
   LabelsEntitiesLabelDynamicValue({required this.content, required this.parentStartIndex, required this.parentEndIndex, required final  List<LabelsEntities> children}): _children = children;
  

 final  String content;
 final  int parentStartIndex;
 final  int parentEndIndex;
 final  List<LabelsEntities> _children;
@override List<LabelsEntities> get children {
  if (_children is EqualUnmodifiableListView) return _children;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_children);
}


/// Create a copy of LabelsEntities
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LabelsEntitiesLabelDynamicValueCopyWith<LabelsEntitiesLabelDynamicValue> get copyWith => _$LabelsEntitiesLabelDynamicValueCopyWithImpl<LabelsEntitiesLabelDynamicValue>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LabelsEntitiesLabelDynamicValue&&(identical(other.content, content) || other.content == content)&&(identical(other.parentStartIndex, parentStartIndex) || other.parentStartIndex == parentStartIndex)&&(identical(other.parentEndIndex, parentEndIndex) || other.parentEndIndex == parentEndIndex)&&const DeepCollectionEquality().equals(other._children, _children));
}


@override
int get hashCode => Object.hash(runtimeType,content,parentStartIndex,parentEndIndex,const DeepCollectionEquality().hash(_children));

@override
String toString() {
  return 'LabelsEntities.labelDynamicValue(content: $content, parentStartIndex: $parentStartIndex, parentEndIndex: $parentEndIndex, children: $children)';
}


}

/// @nodoc
abstract mixin class $LabelsEntitiesLabelDynamicValueCopyWith<$Res> implements $LabelsEntitiesCopyWith<$Res> {
  factory $LabelsEntitiesLabelDynamicValueCopyWith(LabelsEntitiesLabelDynamicValue value, $Res Function(LabelsEntitiesLabelDynamicValue) _then) = _$LabelsEntitiesLabelDynamicValueCopyWithImpl;
@override @useResult
$Res call({
 String content, int parentStartIndex, int parentEndIndex, List<LabelsEntities> children
});




}
/// @nodoc
class _$LabelsEntitiesLabelDynamicValueCopyWithImpl<$Res>
    implements $LabelsEntitiesLabelDynamicValueCopyWith<$Res> {
  _$LabelsEntitiesLabelDynamicValueCopyWithImpl(this._self, this._then);

  final LabelsEntitiesLabelDynamicValue _self;
  final $Res Function(LabelsEntitiesLabelDynamicValue) _then;

/// Create a copy of LabelsEntities
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? content = null,Object? parentStartIndex = null,Object? parentEndIndex = null,Object? children = null,}) {
  return _then(LabelsEntitiesLabelDynamicValue(
content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,parentStartIndex: null == parentStartIndex ? _self.parentStartIndex : parentStartIndex // ignore: cast_nullable_to_non_nullable
as int,parentEndIndex: null == parentEndIndex ? _self.parentEndIndex : parentEndIndex // ignore: cast_nullable_to_non_nullable
as int,children: null == children ? _self._children : children // ignore: cast_nullable_to_non_nullable
as List<LabelsEntities>,
  ));
}


}

// dart format on
