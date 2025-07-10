// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'LoginUserDTO.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$LoginUserDTO {
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;

  /// Create a copy of LoginUserDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LoginUserDTOCopyWith<LoginUserDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginUserDTOCopyWith<$Res> {
  factory $LoginUserDTOCopyWith(
    LoginUserDTO value,
    $Res Function(LoginUserDTO) then,
  ) = _$LoginUserDTOCopyWithImpl<$Res, LoginUserDTO>;
  @useResult
  $Res call({String email, String password});
}

/// @nodoc
class _$LoginUserDTOCopyWithImpl<$Res, $Val extends LoginUserDTO>
    implements $LoginUserDTOCopyWith<$Res> {
  _$LoginUserDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LoginUserDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? email = null, Object? password = null}) {
    return _then(
      _value.copyWith(
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
abstract class _$$LoginUserDTOImplCopyWith<$Res>
    implements $LoginUserDTOCopyWith<$Res> {
  factory _$$LoginUserDTOImplCopyWith(
    _$LoginUserDTOImpl value,
    $Res Function(_$LoginUserDTOImpl) then,
  ) = __$$LoginUserDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String email, String password});
}

/// @nodoc
class __$$LoginUserDTOImplCopyWithImpl<$Res>
    extends _$LoginUserDTOCopyWithImpl<$Res, _$LoginUserDTOImpl>
    implements _$$LoginUserDTOImplCopyWith<$Res> {
  __$$LoginUserDTOImplCopyWithImpl(
    _$LoginUserDTOImpl _value,
    $Res Function(_$LoginUserDTOImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LoginUserDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? email = null, Object? password = null}) {
    return _then(
      _$LoginUserDTOImpl(
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

class _$LoginUserDTOImpl implements _LoginUserDTO {
  const _$LoginUserDTOImpl({required this.email, required this.password});

  @override
  final String email;
  @override
  final String password;

  @override
  String toString() {
    return 'LoginUserDTO(email: $email, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginUserDTOImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email, password);

  /// Create a copy of LoginUserDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginUserDTOImplCopyWith<_$LoginUserDTOImpl> get copyWith =>
      __$$LoginUserDTOImplCopyWithImpl<_$LoginUserDTOImpl>(this, _$identity);
}

abstract class _LoginUserDTO implements LoginUserDTO {
  const factory _LoginUserDTO({
    required final String email,
    required final String password,
  }) = _$LoginUserDTOImpl;

  @override
  String get email;
  @override
  String get password;

  /// Create a copy of LoginUserDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoginUserDTOImplCopyWith<_$LoginUserDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
