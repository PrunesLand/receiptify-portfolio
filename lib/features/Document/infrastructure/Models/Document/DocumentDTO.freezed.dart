// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'DocumentDTO.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$DocumentDTO {
  String get id => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  File get file => throw _privateConstructorUsedError;

  /// Create a copy of DocumentDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DocumentDTOCopyWith<DocumentDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DocumentDTOCopyWith<$Res> {
  factory $DocumentDTOCopyWith(
    DocumentDTO value,
    $Res Function(DocumentDTO) then,
  ) = _$DocumentDTOCopyWithImpl<$Res, DocumentDTO>;
  @useResult
  $Res call({String id, String content, File file});
}

/// @nodoc
class _$DocumentDTOCopyWithImpl<$Res, $Val extends DocumentDTO>
    implements $DocumentDTOCopyWith<$Res> {
  _$DocumentDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DocumentDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = null, Object? content = null, Object? file = null}) {
    return _then(
      _value.copyWith(
            id:
                null == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as String,
            content:
                null == content
                    ? _value.content
                    : content // ignore: cast_nullable_to_non_nullable
                        as String,
            file:
                null == file
                    ? _value.file
                    : file // ignore: cast_nullable_to_non_nullable
                        as File,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DocumentDTOImplCopyWith<$Res>
    implements $DocumentDTOCopyWith<$Res> {
  factory _$$DocumentDTOImplCopyWith(
    _$DocumentDTOImpl value,
    $Res Function(_$DocumentDTOImpl) then,
  ) = __$$DocumentDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String content, File file});
}

/// @nodoc
class __$$DocumentDTOImplCopyWithImpl<$Res>
    extends _$DocumentDTOCopyWithImpl<$Res, _$DocumentDTOImpl>
    implements _$$DocumentDTOImplCopyWith<$Res> {
  __$$DocumentDTOImplCopyWithImpl(
    _$DocumentDTOImpl _value,
    $Res Function(_$DocumentDTOImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DocumentDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = null, Object? content = null, Object? file = null}) {
    return _then(
      _$DocumentDTOImpl(
        id:
            null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as String,
        content:
            null == content
                ? _value.content
                : content // ignore: cast_nullable_to_non_nullable
                    as String,
        file:
            null == file
                ? _value.file
                : file // ignore: cast_nullable_to_non_nullable
                    as File,
      ),
    );
  }
}

/// @nodoc

class _$DocumentDTOImpl implements _DocumentDTO {
  const _$DocumentDTOImpl({
    required this.id,
    required this.content,
    required this.file,
  });

  @override
  final String id;
  @override
  final String content;
  @override
  final File file;

  @override
  String toString() {
    return 'DocumentDTO(id: $id, content: $content, file: $file)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DocumentDTOImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.file, file) || other.file == file));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, content, file);

  /// Create a copy of DocumentDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DocumentDTOImplCopyWith<_$DocumentDTOImpl> get copyWith =>
      __$$DocumentDTOImplCopyWithImpl<_$DocumentDTOImpl>(this, _$identity);
}

abstract class _DocumentDTO implements DocumentDTO {
  const factory _DocumentDTO({
    required final String id,
    required final String content,
    required final File file,
  }) = _$DocumentDTOImpl;

  @override
  String get id;
  @override
  String get content;
  @override
  File get file;

  /// Create a copy of DocumentDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DocumentDTOImplCopyWith<_$DocumentDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
