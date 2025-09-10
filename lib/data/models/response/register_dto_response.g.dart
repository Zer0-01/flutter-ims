// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_dto_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterDtoResponse _$RegisterDtoResponseFromJson(Map<String, dynamic> json) =>
    RegisterDtoResponse(
      data: RegisterData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RegisterDtoResponseToJson(
  RegisterDtoResponse instance,
) => <String, dynamic>{'data': instance.data};

RegisterData _$RegisterDataFromJson(Map<String, dynamic> json) => RegisterData(
  user: RegisterUser.fromJson(json['user'] as Map<String, dynamic>),
  accessToken: json['access_token'] as String,
  refreshToken: json['refresh_token'] as String,
  expiresAt: DateTime.parse(json['expires_at'] as String),
);

Map<String, dynamic> _$RegisterDataToJson(RegisterData instance) =>
    <String, dynamic>{
      'user': instance.user,
      'access_token': instance.accessToken,
      'refresh_token': instance.refreshToken,
      'expires_at': instance.expiresAt.toIso8601String(),
    };

RegisterUser _$RegisterUserFromJson(Map<String, dynamic> json) => RegisterUser(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  email: json['email'] as String,
  role: json['role'] as String,
  emailVerified: json['email_verified'] as bool,
  createdAt: DateTime.parse(json['created_at'] as String),
  updatedAt: DateTime.parse(json['updated_at'] as String),
);

Map<String, dynamic> _$RegisterUserToJson(RegisterUser instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'role': instance.role,
      'email_verified': instance.emailVerified,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };
