// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'me_dto_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MeDtoResponse _$MeDtoResponseFromJson(Map<String, dynamic> json) =>
    MeDtoResponse(MeData.fromJson(json['data'] as Map<String, dynamic>));

Map<String, dynamic> _$MeDtoResponseToJson(MeDtoResponse instance) =>
    <String, dynamic>{'data': instance.data};

MeData _$MeDataFromJson(Map<String, dynamic> json) => MeData(
  name: json['name'] as String,
  email: json['email'] as String,
  emailVerified: json['email_verified'] as bool,
);

Map<String, dynamic> _$MeDataToJson(MeData instance) => <String, dynamic>{
  'name': instance.name,
  'email': instance.email,
  'email_verified': instance.emailVerified,
};
