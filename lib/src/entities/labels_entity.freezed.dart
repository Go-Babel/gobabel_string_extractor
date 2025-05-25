// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'labels_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

LabelsEntity _$LabelsEntityFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'rootLabel':
      return LabelsEntityRootLabel.fromJson(json);
    case 'childLabel':
      return LabelsEntityChildLabel.fromJson(json);
    case 'labelDynamicValue':
      return LabelsEntityLabelDynamicValue.fromJson(json);

    default:
      throw CheckedFromJsonException(
        json,
        'runtimeType',
        'LabelsEntity',
        'Invalid union type "${json['runtimeType']}"!',
      );
  }
}

/// @nodoc
mixin _$LabelsEntity {
  List<LabelsEntity> get children => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      String l10nKey,
      String hardcodedString,
      int fileStartIndex,
      int fileEndIndex,
      String filePath,
      List<LabelsEntity> children,
    )
    rootLabel,
    required TResult Function(
      String l10nKey,
      String hardcodedString,
      int parentStartIndex,
      int parentEndIndex,
      List<LabelsEntity> children,
    )
    childLabel,
    required TResult Function(
      String content,
      int parentStartIndex,
      int parentEndIndex,
      List<LabelsEntity> children,
    )
    labelDynamicValue,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
      String l10nKey,
      String hardcodedString,
      int fileStartIndex,
      int fileEndIndex,
      String filePath,
      List<LabelsEntity> children,
    )?
    rootLabel,
    TResult? Function(
      String l10nKey,
      String hardcodedString,
      int parentStartIndex,
      int parentEndIndex,
      List<LabelsEntity> children,
    )?
    childLabel,
    TResult? Function(
      String content,
      int parentStartIndex,
      int parentEndIndex,
      List<LabelsEntity> children,
    )?
    labelDynamicValue,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
      String l10nKey,
      String hardcodedString,
      int fileStartIndex,
      int fileEndIndex,
      String filePath,
      List<LabelsEntity> children,
    )?
    rootLabel,
    TResult Function(
      String l10nKey,
      String hardcodedString,
      int parentStartIndex,
      int parentEndIndex,
      List<LabelsEntity> children,
    )?
    childLabel,
    TResult Function(
      String content,
      int parentStartIndex,
      int parentEndIndex,
      List<LabelsEntity> children,
    )?
    labelDynamicValue,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LabelsEntityRootLabel value) rootLabel,
    required TResult Function(LabelsEntityChildLabel value) childLabel,
    required TResult Function(LabelsEntityLabelDynamicValue value)
    labelDynamicValue,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LabelsEntityRootLabel value)? rootLabel,
    TResult? Function(LabelsEntityChildLabel value)? childLabel,
    TResult? Function(LabelsEntityLabelDynamicValue value)? labelDynamicValue,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LabelsEntityRootLabel value)? rootLabel,
    TResult Function(LabelsEntityChildLabel value)? childLabel,
    TResult Function(LabelsEntityLabelDynamicValue value)? labelDynamicValue,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Serializes this LabelsEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LabelsEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LabelsEntityCopyWith<LabelsEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LabelsEntityCopyWith<$Res> {
  factory $LabelsEntityCopyWith(
    LabelsEntity value,
    $Res Function(LabelsEntity) then,
  ) = _$LabelsEntityCopyWithImpl<$Res, LabelsEntity>;
  @useResult
  $Res call({List<LabelsEntity> children});
}

/// @nodoc
class _$LabelsEntityCopyWithImpl<$Res, $Val extends LabelsEntity>
    implements $LabelsEntityCopyWith<$Res> {
  _$LabelsEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LabelsEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? children = null}) {
    return _then(
      _value.copyWith(
            children: null == children
                ? _value.children
                : children // ignore: cast_nullable_to_non_nullable
                      as List<LabelsEntity>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$LabelsEntityRootLabelImplCopyWith<$Res>
    implements $LabelsEntityCopyWith<$Res> {
  factory _$$LabelsEntityRootLabelImplCopyWith(
    _$LabelsEntityRootLabelImpl value,
    $Res Function(_$LabelsEntityRootLabelImpl) then,
  ) = __$$LabelsEntityRootLabelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String l10nKey,
    String hardcodedString,
    int fileStartIndex,
    int fileEndIndex,
    String filePath,
    List<LabelsEntity> children,
  });
}

/// @nodoc
class __$$LabelsEntityRootLabelImplCopyWithImpl<$Res>
    extends _$LabelsEntityCopyWithImpl<$Res, _$LabelsEntityRootLabelImpl>
    implements _$$LabelsEntityRootLabelImplCopyWith<$Res> {
  __$$LabelsEntityRootLabelImplCopyWithImpl(
    _$LabelsEntityRootLabelImpl _value,
    $Res Function(_$LabelsEntityRootLabelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LabelsEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? l10nKey = null,
    Object? hardcodedString = null,
    Object? fileStartIndex = null,
    Object? fileEndIndex = null,
    Object? filePath = null,
    Object? children = null,
  }) {
    return _then(
      _$LabelsEntityRootLabelImpl(
        l10nKey: null == l10nKey
            ? _value.l10nKey
            : l10nKey // ignore: cast_nullable_to_non_nullable
                  as String,
        hardcodedString: null == hardcodedString
            ? _value.hardcodedString
            : hardcodedString // ignore: cast_nullable_to_non_nullable
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
                  as List<LabelsEntity>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$LabelsEntityRootLabelImpl implements LabelsEntityRootLabel {
  _$LabelsEntityRootLabelImpl({
    required this.l10nKey,
    required this.hardcodedString,
    required this.fileStartIndex,
    required this.fileEndIndex,
    required this.filePath,
    required final List<LabelsEntity> children,
    final String? $type,
  }) : _children = children,
       $type = $type ?? 'rootLabel';

  factory _$LabelsEntityRootLabelImpl.fromJson(Map<String, dynamic> json) =>
      _$$LabelsEntityRootLabelImplFromJson(json);

  @override
  final String l10nKey;
  @override
  final String hardcodedString;
  @override
  final int fileStartIndex;
  @override
  final int fileEndIndex;
  @override
  final String filePath;
  final List<LabelsEntity> _children;
  @override
  List<LabelsEntity> get children {
    if (_children is EqualUnmodifiableListView) return _children;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_children);
  }

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'LabelsEntity.rootLabel(l10nKey: $l10nKey, hardcodedString: $hardcodedString, fileStartIndex: $fileStartIndex, fileEndIndex: $fileEndIndex, filePath: $filePath, children: $children)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LabelsEntityRootLabelImpl &&
            (identical(other.l10nKey, l10nKey) || other.l10nKey == l10nKey) &&
            (identical(other.hardcodedString, hardcodedString) ||
                other.hardcodedString == hardcodedString) &&
            (identical(other.fileStartIndex, fileStartIndex) ||
                other.fileStartIndex == fileStartIndex) &&
            (identical(other.fileEndIndex, fileEndIndex) ||
                other.fileEndIndex == fileEndIndex) &&
            (identical(other.filePath, filePath) ||
                other.filePath == filePath) &&
            const DeepCollectionEquality().equals(other._children, _children));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    l10nKey,
    hardcodedString,
    fileStartIndex,
    fileEndIndex,
    filePath,
    const DeepCollectionEquality().hash(_children),
  );

  /// Create a copy of LabelsEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LabelsEntityRootLabelImplCopyWith<_$LabelsEntityRootLabelImpl>
  get copyWith =>
      __$$LabelsEntityRootLabelImplCopyWithImpl<_$LabelsEntityRootLabelImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      String l10nKey,
      String hardcodedString,
      int fileStartIndex,
      int fileEndIndex,
      String filePath,
      List<LabelsEntity> children,
    )
    rootLabel,
    required TResult Function(
      String l10nKey,
      String hardcodedString,
      int parentStartIndex,
      int parentEndIndex,
      List<LabelsEntity> children,
    )
    childLabel,
    required TResult Function(
      String content,
      int parentStartIndex,
      int parentEndIndex,
      List<LabelsEntity> children,
    )
    labelDynamicValue,
  }) {
    return rootLabel(
      l10nKey,
      hardcodedString,
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
      String hardcodedString,
      int fileStartIndex,
      int fileEndIndex,
      String filePath,
      List<LabelsEntity> children,
    )?
    rootLabel,
    TResult? Function(
      String l10nKey,
      String hardcodedString,
      int parentStartIndex,
      int parentEndIndex,
      List<LabelsEntity> children,
    )?
    childLabel,
    TResult? Function(
      String content,
      int parentStartIndex,
      int parentEndIndex,
      List<LabelsEntity> children,
    )?
    labelDynamicValue,
  }) {
    return rootLabel?.call(
      l10nKey,
      hardcodedString,
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
      String hardcodedString,
      int fileStartIndex,
      int fileEndIndex,
      String filePath,
      List<LabelsEntity> children,
    )?
    rootLabel,
    TResult Function(
      String l10nKey,
      String hardcodedString,
      int parentStartIndex,
      int parentEndIndex,
      List<LabelsEntity> children,
    )?
    childLabel,
    TResult Function(
      String content,
      int parentStartIndex,
      int parentEndIndex,
      List<LabelsEntity> children,
    )?
    labelDynamicValue,
    required TResult orElse(),
  }) {
    if (rootLabel != null) {
      return rootLabel(
        l10nKey,
        hardcodedString,
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
    required TResult Function(LabelsEntityRootLabel value) rootLabel,
    required TResult Function(LabelsEntityChildLabel value) childLabel,
    required TResult Function(LabelsEntityLabelDynamicValue value)
    labelDynamicValue,
  }) {
    return rootLabel(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LabelsEntityRootLabel value)? rootLabel,
    TResult? Function(LabelsEntityChildLabel value)? childLabel,
    TResult? Function(LabelsEntityLabelDynamicValue value)? labelDynamicValue,
  }) {
    return rootLabel?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LabelsEntityRootLabel value)? rootLabel,
    TResult Function(LabelsEntityChildLabel value)? childLabel,
    TResult Function(LabelsEntityLabelDynamicValue value)? labelDynamicValue,
    required TResult orElse(),
  }) {
    if (rootLabel != null) {
      return rootLabel(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$LabelsEntityRootLabelImplToJson(this);
  }
}

abstract class LabelsEntityRootLabel implements LabelsEntity {
  factory LabelsEntityRootLabel({
    required final String l10nKey,
    required final String hardcodedString,
    required final int fileStartIndex,
    required final int fileEndIndex,
    required final String filePath,
    required final List<LabelsEntity> children,
  }) = _$LabelsEntityRootLabelImpl;

  factory LabelsEntityRootLabel.fromJson(Map<String, dynamic> json) =
      _$LabelsEntityRootLabelImpl.fromJson;

  String get l10nKey;
  String get hardcodedString;
  int get fileStartIndex;
  int get fileEndIndex;
  String get filePath;
  @override
  List<LabelsEntity> get children;

  /// Create a copy of LabelsEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LabelsEntityRootLabelImplCopyWith<_$LabelsEntityRootLabelImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LabelsEntityChildLabelImplCopyWith<$Res>
    implements $LabelsEntityCopyWith<$Res> {
  factory _$$LabelsEntityChildLabelImplCopyWith(
    _$LabelsEntityChildLabelImpl value,
    $Res Function(_$LabelsEntityChildLabelImpl) then,
  ) = __$$LabelsEntityChildLabelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String l10nKey,
    String hardcodedString,
    int parentStartIndex,
    int parentEndIndex,
    List<LabelsEntity> children,
  });
}

/// @nodoc
class __$$LabelsEntityChildLabelImplCopyWithImpl<$Res>
    extends _$LabelsEntityCopyWithImpl<$Res, _$LabelsEntityChildLabelImpl>
    implements _$$LabelsEntityChildLabelImplCopyWith<$Res> {
  __$$LabelsEntityChildLabelImplCopyWithImpl(
    _$LabelsEntityChildLabelImpl _value,
    $Res Function(_$LabelsEntityChildLabelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LabelsEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? l10nKey = null,
    Object? hardcodedString = null,
    Object? parentStartIndex = null,
    Object? parentEndIndex = null,
    Object? children = null,
  }) {
    return _then(
      _$LabelsEntityChildLabelImpl(
        l10nKey: null == l10nKey
            ? _value.l10nKey
            : l10nKey // ignore: cast_nullable_to_non_nullable
                  as String,
        hardcodedString: null == hardcodedString
            ? _value.hardcodedString
            : hardcodedString // ignore: cast_nullable_to_non_nullable
                  as String,
        parentStartIndex: null == parentStartIndex
            ? _value.parentStartIndex
            : parentStartIndex // ignore: cast_nullable_to_non_nullable
                  as int,
        parentEndIndex: null == parentEndIndex
            ? _value.parentEndIndex
            : parentEndIndex // ignore: cast_nullable_to_non_nullable
                  as int,
        children: null == children
            ? _value._children
            : children // ignore: cast_nullable_to_non_nullable
                  as List<LabelsEntity>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$LabelsEntityChildLabelImpl implements LabelsEntityChildLabel {
  _$LabelsEntityChildLabelImpl({
    required this.l10nKey,
    required this.hardcodedString,
    required this.parentStartIndex,
    required this.parentEndIndex,
    required final List<LabelsEntity> children,
    final String? $type,
  }) : _children = children,
       $type = $type ?? 'childLabel';

  factory _$LabelsEntityChildLabelImpl.fromJson(Map<String, dynamic> json) =>
      _$$LabelsEntityChildLabelImplFromJson(json);

  @override
  final String l10nKey;
  @override
  final String hardcodedString;
  @override
  final int parentStartIndex;
  @override
  final int parentEndIndex;
  final List<LabelsEntity> _children;
  @override
  List<LabelsEntity> get children {
    if (_children is EqualUnmodifiableListView) return _children;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_children);
  }

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'LabelsEntity.childLabel(l10nKey: $l10nKey, hardcodedString: $hardcodedString, parentStartIndex: $parentStartIndex, parentEndIndex: $parentEndIndex, children: $children)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LabelsEntityChildLabelImpl &&
            (identical(other.l10nKey, l10nKey) || other.l10nKey == l10nKey) &&
            (identical(other.hardcodedString, hardcodedString) ||
                other.hardcodedString == hardcodedString) &&
            (identical(other.parentStartIndex, parentStartIndex) ||
                other.parentStartIndex == parentStartIndex) &&
            (identical(other.parentEndIndex, parentEndIndex) ||
                other.parentEndIndex == parentEndIndex) &&
            const DeepCollectionEquality().equals(other._children, _children));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    l10nKey,
    hardcodedString,
    parentStartIndex,
    parentEndIndex,
    const DeepCollectionEquality().hash(_children),
  );

  /// Create a copy of LabelsEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LabelsEntityChildLabelImplCopyWith<_$LabelsEntityChildLabelImpl>
  get copyWith =>
      __$$LabelsEntityChildLabelImplCopyWithImpl<_$LabelsEntityChildLabelImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      String l10nKey,
      String hardcodedString,
      int fileStartIndex,
      int fileEndIndex,
      String filePath,
      List<LabelsEntity> children,
    )
    rootLabel,
    required TResult Function(
      String l10nKey,
      String hardcodedString,
      int parentStartIndex,
      int parentEndIndex,
      List<LabelsEntity> children,
    )
    childLabel,
    required TResult Function(
      String content,
      int parentStartIndex,
      int parentEndIndex,
      List<LabelsEntity> children,
    )
    labelDynamicValue,
  }) {
    return childLabel(
      l10nKey,
      hardcodedString,
      parentStartIndex,
      parentEndIndex,
      children,
    );
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
      String l10nKey,
      String hardcodedString,
      int fileStartIndex,
      int fileEndIndex,
      String filePath,
      List<LabelsEntity> children,
    )?
    rootLabel,
    TResult? Function(
      String l10nKey,
      String hardcodedString,
      int parentStartIndex,
      int parentEndIndex,
      List<LabelsEntity> children,
    )?
    childLabel,
    TResult? Function(
      String content,
      int parentStartIndex,
      int parentEndIndex,
      List<LabelsEntity> children,
    )?
    labelDynamicValue,
  }) {
    return childLabel?.call(
      l10nKey,
      hardcodedString,
      parentStartIndex,
      parentEndIndex,
      children,
    );
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
      String l10nKey,
      String hardcodedString,
      int fileStartIndex,
      int fileEndIndex,
      String filePath,
      List<LabelsEntity> children,
    )?
    rootLabel,
    TResult Function(
      String l10nKey,
      String hardcodedString,
      int parentStartIndex,
      int parentEndIndex,
      List<LabelsEntity> children,
    )?
    childLabel,
    TResult Function(
      String content,
      int parentStartIndex,
      int parentEndIndex,
      List<LabelsEntity> children,
    )?
    labelDynamicValue,
    required TResult orElse(),
  }) {
    if (childLabel != null) {
      return childLabel(
        l10nKey,
        hardcodedString,
        parentStartIndex,
        parentEndIndex,
        children,
      );
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LabelsEntityRootLabel value) rootLabel,
    required TResult Function(LabelsEntityChildLabel value) childLabel,
    required TResult Function(LabelsEntityLabelDynamicValue value)
    labelDynamicValue,
  }) {
    return childLabel(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LabelsEntityRootLabel value)? rootLabel,
    TResult? Function(LabelsEntityChildLabel value)? childLabel,
    TResult? Function(LabelsEntityLabelDynamicValue value)? labelDynamicValue,
  }) {
    return childLabel?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LabelsEntityRootLabel value)? rootLabel,
    TResult Function(LabelsEntityChildLabel value)? childLabel,
    TResult Function(LabelsEntityLabelDynamicValue value)? labelDynamicValue,
    required TResult orElse(),
  }) {
    if (childLabel != null) {
      return childLabel(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$LabelsEntityChildLabelImplToJson(this);
  }
}

abstract class LabelsEntityChildLabel implements LabelsEntity {
  factory LabelsEntityChildLabel({
    required final String l10nKey,
    required final String hardcodedString,
    required final int parentStartIndex,
    required final int parentEndIndex,
    required final List<LabelsEntity> children,
  }) = _$LabelsEntityChildLabelImpl;

  factory LabelsEntityChildLabel.fromJson(Map<String, dynamic> json) =
      _$LabelsEntityChildLabelImpl.fromJson;

  String get l10nKey;
  String get hardcodedString;
  int get parentStartIndex;
  int get parentEndIndex;
  @override
  List<LabelsEntity> get children;

  /// Create a copy of LabelsEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LabelsEntityChildLabelImplCopyWith<_$LabelsEntityChildLabelImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LabelsEntityLabelDynamicValueImplCopyWith<$Res>
    implements $LabelsEntityCopyWith<$Res> {
  factory _$$LabelsEntityLabelDynamicValueImplCopyWith(
    _$LabelsEntityLabelDynamicValueImpl value,
    $Res Function(_$LabelsEntityLabelDynamicValueImpl) then,
  ) = __$$LabelsEntityLabelDynamicValueImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String content,
    int parentStartIndex,
    int parentEndIndex,
    List<LabelsEntity> children,
  });
}

/// @nodoc
class __$$LabelsEntityLabelDynamicValueImplCopyWithImpl<$Res>
    extends
        _$LabelsEntityCopyWithImpl<$Res, _$LabelsEntityLabelDynamicValueImpl>
    implements _$$LabelsEntityLabelDynamicValueImplCopyWith<$Res> {
  __$$LabelsEntityLabelDynamicValueImplCopyWithImpl(
    _$LabelsEntityLabelDynamicValueImpl _value,
    $Res Function(_$LabelsEntityLabelDynamicValueImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LabelsEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = null,
    Object? parentStartIndex = null,
    Object? parentEndIndex = null,
    Object? children = null,
  }) {
    return _then(
      _$LabelsEntityLabelDynamicValueImpl(
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
        children: null == children
            ? _value._children
            : children // ignore: cast_nullable_to_non_nullable
                  as List<LabelsEntity>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$LabelsEntityLabelDynamicValueImpl
    implements LabelsEntityLabelDynamicValue {
  _$LabelsEntityLabelDynamicValueImpl({
    required this.content,
    required this.parentStartIndex,
    required this.parentEndIndex,
    required final List<LabelsEntity> children,
    final String? $type,
  }) : _children = children,
       $type = $type ?? 'labelDynamicValue';

  factory _$LabelsEntityLabelDynamicValueImpl.fromJson(
    Map<String, dynamic> json,
  ) => _$$LabelsEntityLabelDynamicValueImplFromJson(json);

  @override
  final String content;
  @override
  final int parentStartIndex;
  @override
  final int parentEndIndex;
  final List<LabelsEntity> _children;
  @override
  List<LabelsEntity> get children {
    if (_children is EqualUnmodifiableListView) return _children;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_children);
  }

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'LabelsEntity.labelDynamicValue(content: $content, parentStartIndex: $parentStartIndex, parentEndIndex: $parentEndIndex, children: $children)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LabelsEntityLabelDynamicValueImpl &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.parentStartIndex, parentStartIndex) ||
                other.parentStartIndex == parentStartIndex) &&
            (identical(other.parentEndIndex, parentEndIndex) ||
                other.parentEndIndex == parentEndIndex) &&
            const DeepCollectionEquality().equals(other._children, _children));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    content,
    parentStartIndex,
    parentEndIndex,
    const DeepCollectionEquality().hash(_children),
  );

  /// Create a copy of LabelsEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LabelsEntityLabelDynamicValueImplCopyWith<
    _$LabelsEntityLabelDynamicValueImpl
  >
  get copyWith =>
      __$$LabelsEntityLabelDynamicValueImplCopyWithImpl<
        _$LabelsEntityLabelDynamicValueImpl
      >(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      String l10nKey,
      String hardcodedString,
      int fileStartIndex,
      int fileEndIndex,
      String filePath,
      List<LabelsEntity> children,
    )
    rootLabel,
    required TResult Function(
      String l10nKey,
      String hardcodedString,
      int parentStartIndex,
      int parentEndIndex,
      List<LabelsEntity> children,
    )
    childLabel,
    required TResult Function(
      String content,
      int parentStartIndex,
      int parentEndIndex,
      List<LabelsEntity> children,
    )
    labelDynamicValue,
  }) {
    return labelDynamicValue(
      content,
      parentStartIndex,
      parentEndIndex,
      children,
    );
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
      String l10nKey,
      String hardcodedString,
      int fileStartIndex,
      int fileEndIndex,
      String filePath,
      List<LabelsEntity> children,
    )?
    rootLabel,
    TResult? Function(
      String l10nKey,
      String hardcodedString,
      int parentStartIndex,
      int parentEndIndex,
      List<LabelsEntity> children,
    )?
    childLabel,
    TResult? Function(
      String content,
      int parentStartIndex,
      int parentEndIndex,
      List<LabelsEntity> children,
    )?
    labelDynamicValue,
  }) {
    return labelDynamicValue?.call(
      content,
      parentStartIndex,
      parentEndIndex,
      children,
    );
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
      String l10nKey,
      String hardcodedString,
      int fileStartIndex,
      int fileEndIndex,
      String filePath,
      List<LabelsEntity> children,
    )?
    rootLabel,
    TResult Function(
      String l10nKey,
      String hardcodedString,
      int parentStartIndex,
      int parentEndIndex,
      List<LabelsEntity> children,
    )?
    childLabel,
    TResult Function(
      String content,
      int parentStartIndex,
      int parentEndIndex,
      List<LabelsEntity> children,
    )?
    labelDynamicValue,
    required TResult orElse(),
  }) {
    if (labelDynamicValue != null) {
      return labelDynamicValue(
        content,
        parentStartIndex,
        parentEndIndex,
        children,
      );
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LabelsEntityRootLabel value) rootLabel,
    required TResult Function(LabelsEntityChildLabel value) childLabel,
    required TResult Function(LabelsEntityLabelDynamicValue value)
    labelDynamicValue,
  }) {
    return labelDynamicValue(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LabelsEntityRootLabel value)? rootLabel,
    TResult? Function(LabelsEntityChildLabel value)? childLabel,
    TResult? Function(LabelsEntityLabelDynamicValue value)? labelDynamicValue,
  }) {
    return labelDynamicValue?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LabelsEntityRootLabel value)? rootLabel,
    TResult Function(LabelsEntityChildLabel value)? childLabel,
    TResult Function(LabelsEntityLabelDynamicValue value)? labelDynamicValue,
    required TResult orElse(),
  }) {
    if (labelDynamicValue != null) {
      return labelDynamicValue(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$LabelsEntityLabelDynamicValueImplToJson(this);
  }
}

abstract class LabelsEntityLabelDynamicValue implements LabelsEntity {
  factory LabelsEntityLabelDynamicValue({
    required final String content,
    required final int parentStartIndex,
    required final int parentEndIndex,
    required final List<LabelsEntity> children,
  }) = _$LabelsEntityLabelDynamicValueImpl;

  factory LabelsEntityLabelDynamicValue.fromJson(Map<String, dynamic> json) =
      _$LabelsEntityLabelDynamicValueImpl.fromJson;

  String get content;
  int get parentStartIndex;
  int get parentEndIndex;
  @override
  List<LabelsEntity> get children;

  /// Create a copy of LabelsEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LabelsEntityLabelDynamicValueImplCopyWith<
    _$LabelsEntityLabelDynamicValueImpl
  >
  get copyWith => throw _privateConstructorUsedError;
}
