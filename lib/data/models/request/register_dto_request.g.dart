// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_dto_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterDtoRequest _$RegisterDtoRequestFromJson(Map<String, dynamic> json) =>
    RegisterDtoRequest(
      name: json['name'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$RegisterDtoRequestToJson(RegisterDtoRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'password': instance.password,
    };

RegisterAdminUser _$RegisterAdminUserFromJson(Map<String, dynamic> json) =>
    RegisterAdminUser(
      name: json['name'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      password: json['password'] as String,
      department: json['department'] as String?,
      position: json['position'] as String?,
    );

Map<String, dynamic> _$RegisterAdminUserToJson(RegisterAdminUser instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'password': instance.password,
      'department': instance.department,
      'position': instance.position,
    };
