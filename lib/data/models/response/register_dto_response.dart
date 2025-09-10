import 'package:json_annotation/json_annotation.dart';

part 'register_dto_response.g.dart';

@JsonSerializable()
class RegisterDtoResponse {
  final RegisterData data;

  RegisterDtoResponse({required this.data});

  factory RegisterDtoResponse.fromJson(Map<String, dynamic> json) =>
      _$RegisterDtoResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterDtoResponseToJson(this);
}

@JsonSerializable()
class RegisterData {
  final RegisterUser user;
  @JsonKey(name: 'access_token')
  final String accessToken;
  @JsonKey(name: 'refresh_token')
  final String refreshToken;
  @JsonKey(name: 'expires_at')
  final DateTime expiresAt;

  RegisterData({
    required this.user,
    required this.accessToken,
    required this.refreshToken,
    required this.expiresAt,
  });

  factory RegisterData.fromJson(Map<String, dynamic> json) =>
      _$RegisterDataFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterDataToJson(this);
}

@JsonSerializable()
class RegisterUser {
  final int id;
  final String name;
  final String email;
  final String role;
  @JsonKey(name: 'email_verified')
  final bool emailVerified;
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;

  RegisterUser({
    required this.id,
    required this.name,
    required this.email,
    required this.role,
    required this.emailVerified,
    required this.createdAt,
    required this.updatedAt,
  });

  factory RegisterUser.fromJson(Map<String, dynamic> json) =>
      _$RegisterUserFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterUserToJson(this);
}
