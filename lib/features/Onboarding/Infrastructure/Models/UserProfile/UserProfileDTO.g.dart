// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UserProfileDTO.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserProfileDTOImpl _$$UserProfileDTOImplFromJson(Map<String, dynamic> json) =>
    _$UserProfileDTOImpl(
      id: json['id'] as String,
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$$UserProfileDTOImplToJson(
  _$UserProfileDTOImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'first_name': instance.firstName,
  'last_name': instance.lastName,
  'email': instance.email,
  'password': instance.password,
};
