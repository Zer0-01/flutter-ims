import 'package:json_annotation/json_annotation.dart';

part 'register_dto_request.g.dart';

@JsonSerializable()
class RegisterDtoRequest {
  final String name;
  final String email;
  final String password;

  RegisterDtoRequest({
    required this.name,
    required this.email,
    required this.password,
  });

  factory RegisterDtoRequest.fromJson(Map<String, dynamic> json) =>
      _$RegisterDtoRequestFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterDtoRequestToJson(this);
}

@JsonSerializable()
class RegisterAdminUser {
  final String name;
  final String email;
  final String phone;
  final String password;
  final String? department;
  final String? position;

  RegisterAdminUser({
    required this.name,
    required this.email,
    required this.phone,
    required this.password,
    this.department,
    this.position,
  });

  factory RegisterAdminUser.fromJson(Map<String, dynamic> json) =>
      _$RegisterAdminUserFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterAdminUserToJson(this);
}
