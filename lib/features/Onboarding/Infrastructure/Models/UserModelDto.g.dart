// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UserModelDto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelDtoImpl _$$UserModelDtoImplFromJson(Map<String, dynamic> json) =>
    _$UserModelDtoImpl(
      id: json['id'] as String,
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$$UserModelDtoImplToJson(_$UserModelDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'email': instance.email,
      'password': instance.password,
    };
