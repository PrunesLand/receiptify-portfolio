// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'RegisterUserDTO.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

RegisterUserDTO _$RegisterUserDTOFromJson(Map<String, dynamic> json) {
  return _RegisterUserDTO.fromJson(json);
}

/// @nodoc
mixin _$RegisterUserDTO {
  String get id => throw _privateConstructorUsedError;
  String get firstName => throw _privateConstructorUsedError;
  String get lastName => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;

  /// Serializes this RegisterUserDTO to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RegisterUserDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RegisterUserDTOCopyWith<RegisterUserDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterUserDTOCopyWith<$Res> {
  factory $RegisterUserDTOCopyWith(
    RegisterUserDTO value,
    $Res Function(RegisterUserDTO) then,
  ) = _$RegisterUserDTOCopyWithImpl<$Res, RegisterUserDTO>;
  @useResult
  $Res call({
    String id,
    String firstName,
    String lastName,
    String email,
    String password,
  });
}

/// @nodoc
class _$RegisterUserDTOCopyWithImpl<$Res, $Val extends RegisterUserDTO>
    implements $RegisterUserDTOCopyWith<$Res> {
  _$RegisterUserDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RegisterUserDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? email = null,
    Object? password = null,
  }) {
    return _then(
      _value.copyWith(
            id:
                null == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as String,
            firstName:
                null == firstName
                    ? _value.firstName
                    : firstName // ignore: cast_nullable_to_non_nullable
                        as String,
            lastName:
                null == lastName
                    ? _value.lastName
                    : lastName // ignore: cast_nullable_to_non_nullable
                        as String,
            email:
                null == email
                    ? _value.email
                    : email // ignore: cast_nullable_to_non_nullable
                        as String,
            password:
                null == password
                    ? _value.password
                    : password // ignore: cast_nullable_to_non_nullable
                        as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$RegisterUserDTOImplCopyWith<$Res>
    implements $RegisterUserDTOCopyWith<$Res> {
  factory _$$RegisterUserDTOImplCopyWith(
    _$RegisterUserDTOImpl value,
    $Res Function(_$RegisterUserDTOImpl) then,
  ) = __$$RegisterUserDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String firstName,
    String lastName,
    String email,
    String password,
  });
}

/// @nodoc
class __$$RegisterUserDTOImplCopyWithImpl<$Res>
    extends _$RegisterUserDTOCopyWithImpl<$Res, _$RegisterUserDTOImpl>
    implements _$$RegisterUserDTOImplCopyWith<$Res> {
  __$$RegisterUserDTOImplCopyWithImpl(
    _$RegisterUserDTOImpl _value,
    $Res Function(_$RegisterUserDTOImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RegisterUserDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? email = null,
    Object? password = null,
  }) {
    return _then(
      _$RegisterUserDTOImpl(
        id:
            null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as String,
        firstName:
            null == firstName
                ? _value.firstName
                : firstName // ignore: cast_nullable_to_non_nullable
                    as String,
        lastName:
            null == lastName
                ? _value.lastName
                : lastName // ignore: cast_nullable_to_non_nullable
                    as String,
        email:
            null == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                    as String,
        password:
            null == password
                ? _value.password
                : password // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$RegisterUserDTOImpl implements _RegisterUserDTO {
  const _$RegisterUserDTOImpl({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
  });

  factory _$RegisterUserDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$RegisterUserDTOImplFromJson(json);

  @override
  final String id;
  @override
  final String firstName;
  @override
  final String lastName;
  @override
  final String email;
  @override
  final String password;

  @override
  String toString() {
    return 'RegisterUserDTO(id: $id, firstName: $firstName, lastName: $lastName, email: $email, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegisterUserDTOImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, firstName, lastName, email, password);

  /// Create a copy of RegisterUserDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RegisterUserDTOImplCopyWith<_$RegisterUserDTOImpl> get copyWith =>
      __$$RegisterUserDTOImplCopyWithImpl<_$RegisterUserDTOImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$RegisterUserDTOImplToJson(this);
  }
}

abstract class _RegisterUserDTO implements RegisterUserDTO {
  const factory _RegisterUserDTO({
    required final String id,
    required final String firstName,
    required final String lastName,
    required final String email,
    required final String password,
  }) = _$RegisterUserDTOImpl;

  factory _RegisterUserDTO.fromJson(Map<String, dynamic> json) =
      _$RegisterUserDTOImpl.fromJson;

  @override
  String get id;
  @override
  String get firstName;
  @override
  String get lastName;
  @override
  String get email;
  @override
  String get password;

  /// Create a copy of RegisterUserDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RegisterUserDTOImplCopyWith<_$RegisterUserDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
