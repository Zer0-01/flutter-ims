// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_dto_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RequestDtoResponse _$RequestDtoResponseFromJson(Map<String, dynamic> json) =>
    RequestDtoResponse(
      name: json['name'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$RequestDtoResponseToJson(RequestDtoResponse instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'password': instance.password,
    };
