import 'package:json_annotation/json_annotation.dart';

part 'login_dto_response.g.dart';

@JsonSerializable()
class LoginDtoResponse {
  final LoginData data;

  LoginDtoResponse({required this.data});

  factory LoginDtoResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginDtoResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginDtoResponseToJson(this);
}

@JsonSerializable()
class LoginData {
  final LoginUser user;
  @JsonKey(name: "access_token")
  final String accessToken;
  @JsonKey(name: "refresh_token")
  final String refreshToken;
  @JsonKey(name: "expires_at")
  final DateTime expiresAt;

  LoginData({
    required this.user,
    required this.accessToken,
    required this.refreshToken,
    required this.expiresAt,
  });

  factory LoginData.fromJson(Map<String, dynamic> json) =>
      _$LoginDataFromJson(json);

  Map<String, dynamic> toJson() => _$LoginDataToJson(this);
}

@JsonSerializable()
class LoginUser {
  final int id;
  final String name;
  final String email;

  LoginUser({required this.id, required this.name, required this.email});

  factory LoginUser.fromJson(Map<String, dynamic> json) =>
      _$LoginUserFromJson(json);

  Map<String, dynamic> toJson() => _$LoginUserToJson(this);
}
