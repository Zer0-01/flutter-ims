// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_category_dto_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateCategoryDtoRequest _$CreateCategoryDtoRequestFromJson(
  Map<String, dynamic> json,
) => CreateCategoryDtoRequest(
  name: json['name'] as String,
  description: json['description'] as String,
);

Map<String, dynamic> _$CreateCategoryDtoRequestToJson(
  CreateCategoryDtoRequest instance,
) => <String, dynamic>{
  'name': instance.name,
  'description': instance.description,
};
