// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'document_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$DocumentState {
  bool get isLoading => throw _privateConstructorUsedError;
  List<ImageModel?> get list => throw _privateConstructorUsedError;
  String get textData => throw _privateConstructorUsedError;
  bool get AddDocModalOpen => throw _privateConstructorUsedError;
  bool get OcrLoading => throw _privateConstructorUsedError;

  /// Create a copy of DocumentState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DocumentStateCopyWith<DocumentState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DocumentStateCopyWith<$Res> {
  factory $DocumentStateCopyWith(
    DocumentState value,
    $Res Function(DocumentState) then,
  ) = _$DocumentStateCopyWithImpl<$Res, DocumentState>;
  @useResult
  $Res call({
    bool isLoading,
    List<ImageModel?> list,
    String textData,
    bool AddDocModalOpen,
    bool OcrLoading,
  });
}

/// @nodoc
class _$DocumentStateCopyWithImpl<$Res, $Val extends DocumentState>
    implements $DocumentStateCopyWith<$Res> {
  _$DocumentStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DocumentState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? list = null,
    Object? textData = null,
    Object? AddDocModalOpen = null,
    Object? OcrLoading = null,
  }) {
    return _then(
      _value.copyWith(
            isLoading:
                null == isLoading
                    ? _value.isLoading
                    : isLoading // ignore: cast_nullable_to_non_nullable
                        as bool,
            list:
                null == list
                    ? _value.list
                    : list // ignore: cast_nullable_to_non_nullable
                        as List<ImageModel?>,
            textData:
                null == textData
                    ? _value.textData
                    : textData // ignore: cast_nullable_to_non_nullable
                        as String,
            AddDocModalOpen:
                null == AddDocModalOpen
                    ? _value.AddDocModalOpen
                    : AddDocModalOpen // ignore: cast_nullable_to_non_nullable
                        as bool,
            OcrLoading:
                null == OcrLoading
                    ? _value.OcrLoading
                    : OcrLoading // ignore: cast_nullable_to_non_nullable
                        as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DocumentStateImplCopyWith<$Res>
    implements $DocumentStateCopyWith<$Res> {
  factory _$$DocumentStateImplCopyWith(
    _$DocumentStateImpl value,
    $Res Function(_$DocumentStateImpl) then,
  ) = __$$DocumentStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool isLoading,
    List<ImageModel?> list,
    String textData,
    bool AddDocModalOpen,
    bool OcrLoading,
  });
}

/// @nodoc
class __$$DocumentStateImplCopyWithImpl<$Res>
    extends _$DocumentStateCopyWithImpl<$Res, _$DocumentStateImpl>
    implements _$$DocumentStateImplCopyWith<$Res> {
  __$$DocumentStateImplCopyWithImpl(
    _$DocumentStateImpl _value,
    $Res Function(_$DocumentStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DocumentState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? list = null,
    Object? textData = null,
    Object? AddDocModalOpen = null,
    Object? OcrLoading = null,
  }) {
    return _then(
      _$DocumentStateImpl(
        isLoading:
            null == isLoading
                ? _value.isLoading
                : isLoading // ignore: cast_nullable_to_non_nullable
                    as bool,
        list:
            null == list
                ? _value._list
                : list // ignore: cast_nullable_to_non_nullable
                    as List<ImageModel?>,
        textData:
            null == textData
                ? _value.textData
                : textData // ignore: cast_nullable_to_non_nullable
                    as String,
        AddDocModalOpen:
            null == AddDocModalOpen
                ? _value.AddDocModalOpen
                : AddDocModalOpen // ignore: cast_nullable_to_non_nullable
                    as bool,
        OcrLoading:
            null == OcrLoading
                ? _value.OcrLoading
                : OcrLoading // ignore: cast_nullable_to_non_nullable
                    as bool,
      ),
    );
  }
}

/// @nodoc

class _$DocumentStateImpl implements _DocumentState {
  const _$DocumentStateImpl({
    this.isLoading = false,
    final List<ImageModel?> list = const [],
    this.textData = '',
    this.AddDocModalOpen = false,
    this.OcrLoading = true,
  }) : _list = list;

  @override
  @JsonKey()
  final bool isLoading;
  final List<ImageModel?> _list;
  @override
  @JsonKey()
  List<ImageModel?> get list {
    if (_list is EqualUnmodifiableListView) return _list;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_list);
  }

  @override
  @JsonKey()
  final String textData;
  @override
  @JsonKey()
  final bool AddDocModalOpen;
  @override
  @JsonKey()
  final bool OcrLoading;

  @override
  String toString() {
    return 'DocumentState(isLoading: $isLoading, list: $list, textData: $textData, AddDocModalOpen: $AddDocModalOpen, OcrLoading: $OcrLoading)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DocumentStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality().equals(other._list, _list) &&
            (identical(other.textData, textData) ||
                other.textData == textData) &&
            (identical(other.AddDocModalOpen, AddDocModalOpen) ||
                other.AddDocModalOpen == AddDocModalOpen) &&
            (identical(other.OcrLoading, OcrLoading) ||
                other.OcrLoading == OcrLoading));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    isLoading,
    const DeepCollectionEquality().hash(_list),
    textData,
    AddDocModalOpen,
    OcrLoading,
  );

  /// Create a copy of DocumentState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DocumentStateImplCopyWith<_$DocumentStateImpl> get copyWith =>
      __$$DocumentStateImplCopyWithImpl<_$DocumentStateImpl>(this, _$identity);
}

abstract class _DocumentState implements DocumentState {
  const factory _DocumentState({
    final bool isLoading,
    final List<ImageModel?> list,
    final String textData,
    final bool AddDocModalOpen,
    final bool OcrLoading,
  }) = _$DocumentStateImpl;

  @override
  bool get isLoading;
  @override
  List<ImageModel?> get list;
  @override
  String get textData;
  @override
  bool get AddDocModalOpen;
  @override
  bool get OcrLoading;

  /// Create a copy of DocumentState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DocumentStateImplCopyWith<_$DocumentStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
