// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_dto_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterDtoRequest _$RegisterDtoRequestFromJson(Map<String, dynamic> json) =>
    RegisterDtoRequest(
      adminUser: RegisterAdminUser.fromJson(
        json['admin_user'] as Map<String, dynamic>,
      ),
      organization: RegisterOrganization.fromJson(
        json['organization'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$RegisterDtoRequestToJson(RegisterDtoRequest instance) =>
    <String, dynamic>{
      'admin_user': instance.adminUser.toJson(),
      'organization': instance.organization.toJson(),
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

RegisterOrganization _$RegisterOrganizationFromJson(
  Map<String, dynamic> json,
) => RegisterOrganization(
  name: json['name'] as String,
  email: json['email'] as String,
);

Map<String, dynamic> _$RegisterOrganizationToJson(
  RegisterOrganization instance,
) => <String, dynamic>{'name': instance.name, 'email': instance.email};
