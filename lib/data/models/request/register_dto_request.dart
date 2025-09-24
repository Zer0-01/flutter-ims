import 'package:json_annotation/json_annotation.dart';

part 'register_dto_request.g.dart';

@JsonSerializable(explicitToJson: true)
class RegisterDtoRequest {
  @JsonKey(name: 'admin_user')
  final RegisterAdminUser adminUser;
  final RegisterOrganization organization;

  RegisterDtoRequest({required this.adminUser, required this.organization});

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

@JsonSerializable()
class RegisterOrganization {
  final String name;
  final String email;

  RegisterOrganization({required this.name, required this.email});

  factory RegisterOrganization.fromJson(Map<String, dynamic> json) =>
      _$RegisterOrganizationFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterOrganizationToJson(this);
}
