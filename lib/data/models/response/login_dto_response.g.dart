// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_dto_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginDtoResponse _$LoginDtoResponseFromJson(Map<String, dynamic> json) =>
    LoginDtoResponse(
      data: LoginData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LoginDtoResponseToJson(LoginDtoResponse instance) =>
    <String, dynamic>{'data': instance.data};

LoginData _$LoginDataFromJson(Map<String, dynamic> json) => LoginData(
  user: LoginUser.fromJson(json['user'] as Map<String, dynamic>),
  accessToken: json['access_token'] as String,
  refreshToken: json['refresh_token'] as String,
  expiresAt: DateTime.parse(json['expires_at'] as String),
);

Map<String, dynamic> _$LoginDataToJson(LoginData instance) => <String, dynamic>{
  'user': instance.user,
  'access_token': instance.accessToken,
  'refresh_token': instance.refreshToken,
  'expires_at': instance.expiresAt.toIso8601String(),
};

LoginUser _$LoginUserFromJson(Map<String, dynamic> json) => LoginUser(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  email: json['email'] as String,
);

Map<String, dynamic> _$LoginUserToJson(LoginUser instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'email': instance.email,
};
