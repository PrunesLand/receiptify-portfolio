// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'RegisterUserDTO.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RegisterUserDTOImpl _$$RegisterUserDTOImplFromJson(
  Map<String, dynamic> json,
) => _$RegisterUserDTOImpl(
  id: json['id'] as String,
  firstName: json['firstName'] as String,
  lastName: json['lastName'] as String,
  email: json['email'] as String,
  password: json['password'] as String,
);

Map<String, dynamic> _$$RegisterUserDTOImplToJson(
  _$RegisterUserDTOImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'firstName': instance.firstName,
  'lastName': instance.lastName,
  'email': instance.email,
  'password': instance.password,
};
