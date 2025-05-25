// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'babel_label_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$BabelLabelEntity {
  String get filePath => throw _privateConstructorUsedError;
  List<BabelLabelEntity> get children => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      String l10nKey,
      String l10nValue,
      String babelFunctionDeclaration,
      String babelFunctionImplementation,
      int fileStartIndex,
      int fileEndIndex,
      String filePath,
      List<BabelLabelEntity> children,
    )
    rootLabel,
    required TResult Function(
      String l10nKey,
      String l10nValue,
      String babelFunctionDeclaration,
      String babelFunctionImplementation,
      int parentStartIndex,
      int parentEndIndex,
      String filePath,
      List<BabelLabelEntity> children,
    )
    childLabel,
    required TResult Function(
      String content,
      int parentStartIndex,
      int parentEndIndex,
      String filePath,
      List<BabelLabelEntity> children,
    )
    labelDynamicValue,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
      String l10nKey,
      String l10nValue,
      String babelFunctionDeclaration,
      String babelFunctionImplementation,
      int fileStartIndex,
      int fileEndIndex,
      String filePath,
      List<BabelLabelEntity> children,
    )?
    rootLabel,
    TResult? Function(
      String l10nKey,
      String l10nValue,
      String babelFunctionDeclaration,
      String babelFunctionImplementation,
      int parentStartIndex,
      int parentEndIndex,
      String filePath,
      List<BabelLabelEntity> children,
    )?
    childLabel,
    TResult? Function(
      String content,
      int parentStartIndex,
      int parentEndIndex,
      String filePath,
      List<BabelLabelEntity> children,
    )?
    labelDynamicValue,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
      String l10nKey,
      String l10nValue,
      String babelFunctionDeclaration,
      String babelFunctionImplementation,
      int fileStartIndex,
      int fileEndIndex,
      String filePath,
      List<BabelLabelEntity> children,
    )?
    rootLabel,
    TResult Function(
      String l10nKey,
      String l10nValue,
      String babelFunctionDeclaration,
      String babelFunctionImplementation,
      int parentStartIndex,
      int parentEndIndex,
      String filePath,
      List<BabelLabelEntity> children,
    )?
    childLabel,
    TResult Function(
      String content,
      int parentStartIndex,
      int parentEndIndex,
      String filePath,
      List<BabelLabelEntity> children,
    )?
    labelDynamicValue,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BabelLabelEntityRootLabel value) rootLabel,
    required TResult Function(BabelLabelEntityChildLabel value) childLabel,
    required TResult Function(BabelLabelEntityLabelDynamicValue value)
    labelDynamicValue,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BabelLabelEntityRootLabel value)? rootLabel,
    TResult? Function(BabelLabelEntityChildLabel value)? childLabel,
    TResult? Function(BabelLabelEntityLabelDynamicValue value)?
    labelDynamicValue,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BabelLabelEntityRootLabel value)? rootLabel,
    TResult Function(BabelLabelEntityChildLabel value)? childLabel,
    TResult Function(BabelLabelEntityLabelDynamicValue value)?
    labelDynamicValue,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Create a copy of BabelLabelEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BabelLabelEntityCopyWith<BabelLabelEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BabelLabelEntityCopyWith<$Res> {
  factory $BabelLabelEntityCopyWith(
    BabelLabelEntity value,
    $Res Function(BabelLabelEntity) then,
  ) = _$BabelLabelEntityCopyWithImpl<$Res, BabelLabelEntity>;
  @useResult
  $Res call({String filePath, List<BabelLabelEntity> children});
}

/// @nodoc
class _$BabelLabelEntityCopyWithImpl<$Res, $Val extends BabelLabelEntity>
    implements $BabelLabelEntityCopyWith<$Res> {
  _$BabelLabelEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BabelLabelEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? filePath = null, Object? children = null}) {
    return _then(
      _value.copyWith(
            filePath: null == filePath
                ? _value.filePath
                : filePath // ignore: cast_nullable_to_non_nullable
                      as String,
            children: null == children
                ? _value.children
                : children // ignore: cast_nullable_to_non_nullable
                      as List<BabelLabelEntity>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$BabelLabelEntityRootLabelImplCopyWith<$Res>
    implements $BabelLabelEntityCopyWith<$Res> {
  factory _$$BabelLabelEntityRootLabelImplCopyWith(
    _$BabelLabelEntityRootLabelImpl value,
    $Res Function(_$BabelLabelEntityRootLabelImpl) then,
  ) = __$$BabelLabelEntityRootLabelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String l10nKey,
    String l10nValue,
    String babelFunctionDeclaration,
    String babelFunctionImplementation,
    int fileStartIndex,
    int fileEndIndex,
    String filePath,
    List<BabelLabelEntity> children,
  });
}

/// @nodoc
class __$$BabelLabelEntityRootLabelImplCopyWithImpl<$Res>
    extends
        _$BabelLabelEntityCopyWithImpl<$Res, _$BabelLabelEntityRootLabelImpl>
    implements _$$BabelLabelEntityRootLabelImplCopyWith<$Res> {
  __$$BabelLabelEntityRootLabelImplCopyWithImpl(
    _$BabelLabelEntityRootLabelImpl _value,
    $Res Function(_$BabelLabelEntityRootLabelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BabelLabelEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? l10nKey = null,
    Object? l10nValue = null,
    Object? babelFunctionDeclaration = null,
    Object? babelFunctionImplementation = null,
    Object? fileStartIndex = null,
    Object? fileEndIndex = null,
    Object? filePath = null,
    Object? children = null,
  }) {
    return _then(
      _$BabelLabelEntityRootLabelImpl(
        l10nKey: null == l10nKey
            ? _value.l10nKey
            : l10nKey // ignore: cast_nullable_to_non_nullable
                  as String,
        l10nValue: null == l10nValue
            ? _value.l10nValue
            : l10nValue // ignore: cast_nullable_to_non_nullable
                  as String,
        babelFunctionDeclaration: null == babelFunctionDeclaration
            ? _value.babelFunctionDeclaration
            : babelFunctionDeclaration // ignore: cast_nullable_to_non_nullable
                  as String,
        babelFunctionImplementation: null == babelFunctionImplementation
            ? _value.babelFunctionImplementation
            : babelFunctionImplementation // ignore: cast_nullable_to_non_nullable
                  as String,
        fileStartIndex: null == fileStartIndex
            ? _value.fileStartIndex
            : fileStartIndex // ignore: cast_nullable_to_non_nullable
                  as int,
        fileEndIndex: null == fileEndIndex
            ? _value.fileEndIndex
            : fileEndIndex // ignore: cast_nullable_to_non_nullable
                  as int,
        filePath: null == filePath
            ? _value.filePath
            : filePath // ignore: cast_nullable_to_non_nullable
                  as String,
        children: null == children
            ? _value._children
            : children // ignore: cast_nullable_to_non_nullable
                  as List<BabelLabelEntity>,
      ),
    );
  }
}

/// @nodoc

class _$BabelLabelEntityRootLabelImpl implements BabelLabelEntityRootLabel {
  _$BabelLabelEntityRootLabelImpl({
    required this.l10nKey,
    required this.l10nValue,
    required this.babelFunctionDeclaration,
    required this.babelFunctionImplementation,
    required this.fileStartIndex,
    required this.fileEndIndex,
    required this.filePath,
    required final List<BabelLabelEntity> children,
  }) : _children = children;

  @override
  final String l10nKey;
  @override
  final String l10nValue;
  @override
  final String babelFunctionDeclaration;
  @override
  final String babelFunctionImplementation;
  @override
  final int fileStartIndex;
  @override
  final int fileEndIndex;
  @override
  final String filePath;
  final List<BabelLabelEntity> _children;
  @override
  List<BabelLabelEntity> get children {
    if (_children is EqualUnmodifiableListView) return _children;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_children);
  }

  @override
  String toString() {
    return 'BabelLabelEntity.rootLabel(l10nKey: $l10nKey, l10nValue: $l10nValue, babelFunctionDeclaration: $babelFunctionDeclaration, babelFunctionImplementation: $babelFunctionImplementation, fileStartIndex: $fileStartIndex, fileEndIndex: $fileEndIndex, filePath: $filePath, children: $children)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BabelLabelEntityRootLabelImpl &&
            (identical(other.l10nKey, l10nKey) || other.l10nKey == l10nKey) &&
            (identical(other.l10nValue, l10nValue) ||
                other.l10nValue == l10nValue) &&
            (identical(
                  other.babelFunctionDeclaration,
                  babelFunctionDeclaration,
                ) ||
                other.babelFunctionDeclaration == babelFunctionDeclaration) &&
            (identical(
                  other.babelFunctionImplementation,
                  babelFunctionImplementation,
                ) ||
                other.babelFunctionImplementation ==
                    babelFunctionImplementation) &&
            (identical(other.fileStartIndex, fileStartIndex) ||
                other.fileStartIndex == fileStartIndex) &&
            (identical(other.fileEndIndex, fileEndIndex) ||
                other.fileEndIndex == fileEndIndex) &&
            (identical(other.filePath, filePath) ||
                other.filePath == filePath) &&
            const DeepCollectionEquality().equals(other._children, _children));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    l10nKey,
    l10nValue,
    babelFunctionDeclaration,
    babelFunctionImplementation,
    fileStartIndex,
    fileEndIndex,
    filePath,
    const DeepCollectionEquality().hash(_children),
  );

  /// Create a copy of BabelLabelEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BabelLabelEntityRootLabelImplCopyWith<_$BabelLabelEntityRootLabelImpl>
  get copyWith =>
      __$$BabelLabelEntityRootLabelImplCopyWithImpl<
        _$BabelLabelEntityRootLabelImpl
      >(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      String l10nKey,
      String l10nValue,
      String babelFunctionDeclaration,
      String babelFunctionImplementation,
      int fileStartIndex,
      int fileEndIndex,
      String filePath,
      List<BabelLabelEntity> children,
    )
    rootLabel,
    required TResult Function(
      String l10nKey,
      String l10nValue,
      String babelFunctionDeclaration,
      String babelFunctionImplementation,
      int parentStartIndex,
      int parentEndIndex,
      String filePath,
      List<BabelLabelEntity> children,
    )
    childLabel,
    required TResult Function(
      String content,
      int parentStartIndex,
      int parentEndIndex,
      String filePath,
      List<BabelLabelEntity> children,
    )
    labelDynamicValue,
  }) {
    return rootLabel(
      l10nKey,
      l10nValue,
      babelFunctionDeclaration,
      babelFunctionImplementation,
      fileStartIndex,
      fileEndIndex,
      filePath,
      children,
    );
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
      String l10nKey,
      String l10nValue,
      String babelFunctionDeclaration,
      String babelFunctionImplementation,
      int fileStartIndex,
      int fileEndIndex,
      String filePath,
      List<BabelLabelEntity> children,
    )?
    rootLabel,
    TResult? Function(
      String l10nKey,
      String l10nValue,
      String babelFunctionDeclaration,
      String babelFunctionImplementation,
      int parentStartIndex,
      int parentEndIndex,
      String filePath,
      List<BabelLabelEntity> children,
    )?
    childLabel,
    TResult? Function(
      String content,
      int parentStartIndex,
      int parentEndIndex,
      String filePath,
      List<BabelLabelEntity> children,
    )?
    labelDynamicValue,
  }) {
    return rootLabel?.call(
      l10nKey,
      l10nValue,
      babelFunctionDeclaration,
      babelFunctionImplementation,
      fileStartIndex,
      fileEndIndex,
      filePath,
      children,
    );
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
      String l10nKey,
      String l10nValue,
      String babelFunctionDeclaration,
      String babelFunctionImplementation,
      int fileStartIndex,
      int fileEndIndex,
      String filePath,
      List<BabelLabelEntity> children,
    )?
    rootLabel,
    TResult Function(
      String l10nKey,
      String l10nValue,
      String babelFunctionDeclaration,
      String babelFunctionImplementation,
      int parentStartIndex,
      int parentEndIndex,
      String filePath,
      List<BabelLabelEntity> children,
    )?
    childLabel,
    TResult Function(
      String content,
      int parentStartIndex,
      int parentEndIndex,
      String filePath,
      List<BabelLabelEntity> children,
    )?
    labelDynamicValue,
    required TResult orElse(),
  }) {
    if (rootLabel != null) {
      return rootLabel(
        l10nKey,
        l10nValue,
        babelFunctionDeclaration,
        babelFunctionImplementation,
        fileStartIndex,
        fileEndIndex,
        filePath,
        children,
      );
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BabelLabelEntityRootLabel value) rootLabel,
    required TResult Function(BabelLabelEntityChildLabel value) childLabel,
    required TResult Function(BabelLabelEntityLabelDynamicValue value)
    labelDynamicValue,
  }) {
    return rootLabel(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BabelLabelEntityRootLabel value)? rootLabel,
    TResult? Function(BabelLabelEntityChildLabel value)? childLabel,
    TResult? Function(BabelLabelEntityLabelDynamicValue value)?
    labelDynamicValue,
  }) {
    return rootLabel?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BabelLabelEntityRootLabel value)? rootLabel,
    TResult Function(BabelLabelEntityChildLabel value)? childLabel,
    TResult Function(BabelLabelEntityLabelDynamicValue value)?
    labelDynamicValue,
    required TResult orElse(),
  }) {
    if (rootLabel != null) {
      return rootLabel(this);
    }
    return orElse();
  }
}

abstract class BabelLabelEntityRootLabel implements BabelLabelEntity {
  factory BabelLabelEntityRootLabel({
    required final String l10nKey,
    required final String l10nValue,
    required final String babelFunctionDeclaration,
    required final String babelFunctionImplementation,
    required final int fileStartIndex,
    required final int fileEndIndex,
    required final String filePath,
    required final List<BabelLabelEntity> children,
  }) = _$BabelLabelEntityRootLabelImpl;

  String get l10nKey;
  String get l10nValue;
  String get babelFunctionDeclaration;
  String get babelFunctionImplementation;
  int get fileStartIndex;
  int get fileEndIndex;
  @override
  String get filePath;
  @override
  List<BabelLabelEntity> get children;

  /// Create a copy of BabelLabelEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BabelLabelEntityRootLabelImplCopyWith<_$BabelLabelEntityRootLabelImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$BabelLabelEntityChildLabelImplCopyWith<$Res>
    implements $BabelLabelEntityCopyWith<$Res> {
  factory _$$BabelLabelEntityChildLabelImplCopyWith(
    _$BabelLabelEntityChildLabelImpl value,
    $Res Function(_$BabelLabelEntityChildLabelImpl) then,
  ) = __$$BabelLabelEntityChildLabelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String l10nKey,
    String l10nValue,
    String babelFunctionDeclaration,
    String babelFunctionImplementation,
    int parentStartIndex,
    int parentEndIndex,
    String filePath,
    List<BabelLabelEntity> children,
  });
}

/// @nodoc
class __$$BabelLabelEntityChildLabelImplCopyWithImpl<$Res>
    extends
        _$BabelLabelEntityCopyWithImpl<$Res, _$BabelLabelEntityChildLabelImpl>
    implements _$$BabelLabelEntityChildLabelImplCopyWith<$Res> {
  __$$BabelLabelEntityChildLabelImplCopyWithImpl(
    _$BabelLabelEntityChildLabelImpl _value,
    $Res Function(_$BabelLabelEntityChildLabelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BabelLabelEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? l10nKey = null,
    Object? l10nValue = null,
    Object? babelFunctionDeclaration = null,
    Object? babelFunctionImplementation = null,
    Object? parentStartIndex = null,
    Object? parentEndIndex = null,
    Object? filePath = null,
    Object? children = null,
  }) {
    return _then(
      _$BabelLabelEntityChildLabelImpl(
        l10nKey: null == l10nKey
            ? _value.l10nKey
            : l10nKey // ignore: cast_nullable_to_non_nullable
                  as String,
        l10nValue: null == l10nValue
            ? _value.l10nValue
            : l10nValue // ignore: cast_nullable_to_non_nullable
                  as String,
        babelFunctionDeclaration: null == babelFunctionDeclaration
            ? _value.babelFunctionDeclaration
            : babelFunctionDeclaration // ignore: cast_nullable_to_non_nullable
                  as String,
        babelFunctionImplementation: null == babelFunctionImplementation
            ? _value.babelFunctionImplementation
            : babelFunctionImplementation // ignore: cast_nullable_to_non_nullable
                  as String,
        parentStartIndex: null == parentStartIndex
            ? _value.parentStartIndex
            : parentStartIndex // ignore: cast_nullable_to_non_nullable
                  as int,
        parentEndIndex: null == parentEndIndex
            ? _value.parentEndIndex
            : parentEndIndex // ignore: cast_nullable_to_non_nullable
                  as int,
        filePath: null == filePath
            ? _value.filePath
            : filePath // ignore: cast_nullable_to_non_nullable
                  as String,
        children: null == children
            ? _value._children
            : children // ignore: cast_nullable_to_non_nullable
                  as List<BabelLabelEntity>,
      ),
    );
  }
}

/// @nodoc

class _$BabelLabelEntityChildLabelImpl implements BabelLabelEntityChildLabel {
  _$BabelLabelEntityChildLabelImpl({
    required this.l10nKey,
    required this.l10nValue,
    required this.babelFunctionDeclaration,
    required this.babelFunctionImplementation,
    required this.parentStartIndex,
    required this.parentEndIndex,
    required this.filePath,
    required final List<BabelLabelEntity> children,
  }) : _children = children;

  @override
  final String l10nKey;
  // ✅ CHECK
  @override
  final String l10nValue;
  @override
  final String babelFunctionDeclaration;
  @override
  final String babelFunctionImplementation;
  @override
  final int parentStartIndex;
  // ✅ CHECK
  @override
  final int parentEndIndex;
  // ✅ CHECK
  @override
  final String filePath;
  final List<BabelLabelEntity> _children;
  @override
  List<BabelLabelEntity> get children {
    if (_children is EqualUnmodifiableListView) return _children;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_children);
  }

  @override
  String toString() {
    return 'BabelLabelEntity.childLabel(l10nKey: $l10nKey, l10nValue: $l10nValue, babelFunctionDeclaration: $babelFunctionDeclaration, babelFunctionImplementation: $babelFunctionImplementation, parentStartIndex: $parentStartIndex, parentEndIndex: $parentEndIndex, filePath: $filePath, children: $children)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BabelLabelEntityChildLabelImpl &&
            (identical(other.l10nKey, l10nKey) || other.l10nKey == l10nKey) &&
            (identical(other.l10nValue, l10nValue) ||
                other.l10nValue == l10nValue) &&
            (identical(
                  other.babelFunctionDeclaration,
                  babelFunctionDeclaration,
                ) ||
                other.babelFunctionDeclaration == babelFunctionDeclaration) &&
            (identical(
                  other.babelFunctionImplementation,
                  babelFunctionImplementation,
                ) ||
                other.babelFunctionImplementation ==
                    babelFunctionImplementation) &&
            (identical(other.parentStartIndex, parentStartIndex) ||
                other.parentStartIndex == parentStartIndex) &&
            (identical(other.parentEndIndex, parentEndIndex) ||
                other.parentEndIndex == parentEndIndex) &&
            (identical(other.filePath, filePath) ||
                other.filePath == filePath) &&
            const DeepCollectionEquality().equals(other._children, _children));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    l10nKey,
    l10nValue,
    babelFunctionDeclaration,
    babelFunctionImplementation,
    parentStartIndex,
    parentEndIndex,
    filePath,
    const DeepCollectionEquality().hash(_children),
  );

  /// Create a copy of BabelLabelEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BabelLabelEntityChildLabelImplCopyWith<_$BabelLabelEntityChildLabelImpl>
  get copyWith =>
      __$$BabelLabelEntityChildLabelImplCopyWithImpl<
        _$BabelLabelEntityChildLabelImpl
      >(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      String l10nKey,
      String l10nValue,
      String babelFunctionDeclaration,
      String babelFunctionImplementation,
      int fileStartIndex,
      int fileEndIndex,
      String filePath,
      List<BabelLabelEntity> children,
    )
    rootLabel,
    required TResult Function(
      String l10nKey,
      String l10nValue,
      String babelFunctionDeclaration,
      String babelFunctionImplementation,
      int parentStartIndex,
      int parentEndIndex,
      String filePath,
      List<BabelLabelEntity> children,
    )
    childLabel,
    required TResult Function(
      String content,
      int parentStartIndex,
      int parentEndIndex,
      String filePath,
      List<BabelLabelEntity> children,
    )
    labelDynamicValue,
  }) {
    return childLabel(
      l10nKey,
      l10nValue,
      babelFunctionDeclaration,
      babelFunctionImplementation,
      parentStartIndex,
      parentEndIndex,
      filePath,
      children,
    );
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
      String l10nKey,
      String l10nValue,
      String babelFunctionDeclaration,
      String babelFunctionImplementation,
      int fileStartIndex,
      int fileEndIndex,
      String filePath,
      List<BabelLabelEntity> children,
    )?
    rootLabel,
    TResult? Function(
      String l10nKey,
      String l10nValue,
      String babelFunctionDeclaration,
      String babelFunctionImplementation,
      int parentStartIndex,
      int parentEndIndex,
      String filePath,
      List<BabelLabelEntity> children,
    )?
    childLabel,
    TResult? Function(
      String content,
      int parentStartIndex,
      int parentEndIndex,
      String filePath,
      List<BabelLabelEntity> children,
    )?
    labelDynamicValue,
  }) {
    return childLabel?.call(
      l10nKey,
      l10nValue,
      babelFunctionDeclaration,
      babelFunctionImplementation,
      parentStartIndex,
      parentEndIndex,
      filePath,
      children,
    );
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
      String l10nKey,
      String l10nValue,
      String babelFunctionDeclaration,
      String babelFunctionImplementation,
      int fileStartIndex,
      int fileEndIndex,
      String filePath,
      List<BabelLabelEntity> children,
    )?
    rootLabel,
    TResult Function(
      String l10nKey,
      String l10nValue,
      String babelFunctionDeclaration,
      String babelFunctionImplementation,
      int parentStartIndex,
      int parentEndIndex,
      String filePath,
      List<BabelLabelEntity> children,
    )?
    childLabel,
    TResult Function(
      String content,
      int parentStartIndex,
      int parentEndIndex,
      String filePath,
      List<BabelLabelEntity> children,
    )?
    labelDynamicValue,
    required TResult orElse(),
  }) {
    if (childLabel != null) {
      return childLabel(
        l10nKey,
        l10nValue,
        babelFunctionDeclaration,
        babelFunctionImplementation,
        parentStartIndex,
        parentEndIndex,
        filePath,
        children,
      );
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BabelLabelEntityRootLabel value) rootLabel,
    required TResult Function(BabelLabelEntityChildLabel value) childLabel,
    required TResult Function(BabelLabelEntityLabelDynamicValue value)
    labelDynamicValue,
  }) {
    return childLabel(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BabelLabelEntityRootLabel value)? rootLabel,
    TResult? Function(BabelLabelEntityChildLabel value)? childLabel,
    TResult? Function(BabelLabelEntityLabelDynamicValue value)?
    labelDynamicValue,
  }) {
    return childLabel?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BabelLabelEntityRootLabel value)? rootLabel,
    TResult Function(BabelLabelEntityChildLabel value)? childLabel,
    TResult Function(BabelLabelEntityLabelDynamicValue value)?
    labelDynamicValue,
    required TResult orElse(),
  }) {
    if (childLabel != null) {
      return childLabel(this);
    }
    return orElse();
  }
}

abstract class BabelLabelEntityChildLabel implements BabelLabelEntity {
  factory BabelLabelEntityChildLabel({
    required final String l10nKey,
    required final String l10nValue,
    required final String babelFunctionDeclaration,
    required final String babelFunctionImplementation,
    required final int parentStartIndex,
    required final int parentEndIndex,
    required final String filePath,
    required final List<BabelLabelEntity> children,
  }) = _$BabelLabelEntityChildLabelImpl;

  String get l10nKey; // ✅ CHECK
  String get l10nValue;
  String get babelFunctionDeclaration;
  String get babelFunctionImplementation;
  int get parentStartIndex; // ✅ CHECK
  int get parentEndIndex; // ✅ CHECK
  @override
  String get filePath;
  @override
  List<BabelLabelEntity> get children;

  /// Create a copy of BabelLabelEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BabelLabelEntityChildLabelImplCopyWith<_$BabelLabelEntityChildLabelImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$BabelLabelEntityLabelDynamicValueImplCopyWith<$Res>
    implements $BabelLabelEntityCopyWith<$Res> {
  factory _$$BabelLabelEntityLabelDynamicValueImplCopyWith(
    _$BabelLabelEntityLabelDynamicValueImpl value,
    $Res Function(_$BabelLabelEntityLabelDynamicValueImpl) then,
  ) = __$$BabelLabelEntityLabelDynamicValueImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String content,
    int parentStartIndex,
    int parentEndIndex,
    String filePath,
    List<BabelLabelEntity> children,
  });
}

/// @nodoc
class __$$BabelLabelEntityLabelDynamicValueImplCopyWithImpl<$Res>
    extends
        _$BabelLabelEntityCopyWithImpl<
          $Res,
          _$BabelLabelEntityLabelDynamicValueImpl
        >
    implements _$$BabelLabelEntityLabelDynamicValueImplCopyWith<$Res> {
  __$$BabelLabelEntityLabelDynamicValueImplCopyWithImpl(
    _$BabelLabelEntityLabelDynamicValueImpl _value,
    $Res Function(_$BabelLabelEntityLabelDynamicValueImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BabelLabelEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = null,
    Object? parentStartIndex = null,
    Object? parentEndIndex = null,
    Object? filePath = null,
    Object? children = null,
  }) {
    return _then(
      _$BabelLabelEntityLabelDynamicValueImpl(
        content: null == content
            ? _value.content
            : content // ignore: cast_nullable_to_non_nullable
                  as String,
        parentStartIndex: null == parentStartIndex
            ? _value.parentStartIndex
            : parentStartIndex // ignore: cast_nullable_to_non_nullable
                  as int,
        parentEndIndex: null == parentEndIndex
            ? _value.parentEndIndex
            : parentEndIndex // ignore: cast_nullable_to_non_nullable
                  as int,
        filePath: null == filePath
            ? _value.filePath
            : filePath // ignore: cast_nullable_to_non_nullable
                  as String,
        children: null == children
            ? _value._children
            : children // ignore: cast_nullable_to_non_nullable
                  as List<BabelLabelEntity>,
      ),
    );
  }
}

/// @nodoc

class _$BabelLabelEntityLabelDynamicValueImpl
    implements BabelLabelEntityLabelDynamicValue {
  _$BabelLabelEntityLabelDynamicValueImpl({
    required this.content,
    required this.parentStartIndex,
    required this.parentEndIndex,
    required this.filePath,
    required final List<BabelLabelEntity> children,
  }) : _children = children;

  @override
  final String content;
  @override
  final int parentStartIndex;
  @override
  final int parentEndIndex;
  @override
  final String filePath;
  final List<BabelLabelEntity> _children;
  @override
  List<BabelLabelEntity> get children {
    if (_children is EqualUnmodifiableListView) return _children;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_children);
  }

  @override
  String toString() {
    return 'BabelLabelEntity.labelDynamicValue(content: $content, parentStartIndex: $parentStartIndex, parentEndIndex: $parentEndIndex, filePath: $filePath, children: $children)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BabelLabelEntityLabelDynamicValueImpl &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.parentStartIndex, parentStartIndex) ||
                other.parentStartIndex == parentStartIndex) &&
            (identical(other.parentEndIndex, parentEndIndex) ||
                other.parentEndIndex == parentEndIndex) &&
            (identical(other.filePath, filePath) ||
                other.filePath == filePath) &&
            const DeepCollectionEquality().equals(other._children, _children));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    content,
    parentStartIndex,
    parentEndIndex,
    filePath,
    const DeepCollectionEquality().hash(_children),
  );

  /// Create a copy of BabelLabelEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BabelLabelEntityLabelDynamicValueImplCopyWith<
    _$BabelLabelEntityLabelDynamicValueImpl
  >
  get copyWith =>
      __$$BabelLabelEntityLabelDynamicValueImplCopyWithImpl<
        _$BabelLabelEntityLabelDynamicValueImpl
      >(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      String l10nKey,
      String l10nValue,
      String babelFunctionDeclaration,
      String babelFunctionImplementation,
      int fileStartIndex,
      int fileEndIndex,
      String filePath,
      List<BabelLabelEntity> children,
    )
    rootLabel,
    required TResult Function(
      String l10nKey,
      String l10nValue,
      String babelFunctionDeclaration,
      String babelFunctionImplementation,
      int parentStartIndex,
      int parentEndIndex,
      String filePath,
      List<BabelLabelEntity> children,
    )
    childLabel,
    required TResult Function(
      String content,
      int parentStartIndex,
      int parentEndIndex,
      String filePath,
      List<BabelLabelEntity> children,
    )
    labelDynamicValue,
  }) {
    return labelDynamicValue(
      content,
      parentStartIndex,
      parentEndIndex,
      filePath,
      children,
    );
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
      String l10nKey,
      String l10nValue,
      String babelFunctionDeclaration,
      String babelFunctionImplementation,
      int fileStartIndex,
      int fileEndIndex,
      String filePath,
      List<BabelLabelEntity> children,
    )?
    rootLabel,
    TResult? Function(
      String l10nKey,
      String l10nValue,
      String babelFunctionDeclaration,
      String babelFunctionImplementation,
      int parentStartIndex,
      int parentEndIndex,
      String filePath,
      List<BabelLabelEntity> children,
    )?
    childLabel,
    TResult? Function(
      String content,
      int parentStartIndex,
      int parentEndIndex,
      String filePath,
      List<BabelLabelEntity> children,
    )?
    labelDynamicValue,
  }) {
    return labelDynamicValue?.call(
      content,
      parentStartIndex,
      parentEndIndex,
      filePath,
      children,
    );
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
      String l10nKey,
      String l10nValue,
      String babelFunctionDeclaration,
      String babelFunctionImplementation,
      int fileStartIndex,
      int fileEndIndex,
      String filePath,
      List<BabelLabelEntity> children,
    )?
    rootLabel,
    TResult Function(
      String l10nKey,
      String l10nValue,
      String babelFunctionDeclaration,
      String babelFunctionImplementation,
      int parentStartIndex,
      int parentEndIndex,
      String filePath,
      List<BabelLabelEntity> children,
    )?
    childLabel,
    TResult Function(
      String content,
      int parentStartIndex,
      int parentEndIndex,
      String filePath,
      List<BabelLabelEntity> children,
    )?
    labelDynamicValue,
    required TResult orElse(),
  }) {
    if (labelDynamicValue != null) {
      return labelDynamicValue(
        content,
        parentStartIndex,
        parentEndIndex,
        filePath,
        children,
      );
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BabelLabelEntityRootLabel value) rootLabel,
    required TResult Function(BabelLabelEntityChildLabel value) childLabel,
    required TResult Function(BabelLabelEntityLabelDynamicValue value)
    labelDynamicValue,
  }) {
    return labelDynamicValue(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BabelLabelEntityRootLabel value)? rootLabel,
    TResult? Function(BabelLabelEntityChildLabel value)? childLabel,
    TResult? Function(BabelLabelEntityLabelDynamicValue value)?
    labelDynamicValue,
  }) {
    return labelDynamicValue?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BabelLabelEntityRootLabel value)? rootLabel,
    TResult Function(BabelLabelEntityChildLabel value)? childLabel,
    TResult Function(BabelLabelEntityLabelDynamicValue value)?
    labelDynamicValue,
    required TResult orElse(),
  }) {
    if (labelDynamicValue != null) {
      return labelDynamicValue(this);
    }
    return orElse();
  }
}

abstract class BabelLabelEntityLabelDynamicValue implements BabelLabelEntity {
  factory BabelLabelEntityLabelDynamicValue({
    required final String content,
    required final int parentStartIndex,
    required final int parentEndIndex,
    required final String filePath,
    required final List<BabelLabelEntity> children,
  }) = _$BabelLabelEntityLabelDynamicValueImpl;

  String get content;
  int get parentStartIndex;
  int get parentEndIndex;
  @override
  String get filePath;
  @override
  List<BabelLabelEntity> get children;

  /// Create a copy of BabelLabelEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BabelLabelEntityLabelDynamicValueImplCopyWith<
    _$BabelLabelEntityLabelDynamicValueImpl
  >
  get copyWith => throw _privateConstructorUsedError;
}
