// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'me_dto_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MeDtoResponse _$MeDtoResponseFromJson(Map<String, dynamic> json) =>
    MeDtoResponse(MeData.fromJson(json['data'] as Map<String, dynamic>));

Map<String, dynamic> _$MeDtoResponseToJson(MeDtoResponse instance) =>
    <String, dynamic>{'data': instance.data};

MeData _$MeDataFromJson(Map<String, dynamic> json) =>
    MeData(json['name'] as String);

Map<String, dynamic> _$MeDataToJson(MeData instance) => <String, dynamic>{
  'name': instance.name,
};
