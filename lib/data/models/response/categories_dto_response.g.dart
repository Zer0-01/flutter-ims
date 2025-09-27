// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categories_dto_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoriesDtoResponse _$CategoriesDtoResponseFromJson(
  Map<String, dynamic> json,
) => CategoriesDtoResponse(
  data:
      (json['data'] as List<dynamic>)
          .map((e) => CategoriesData.fromJson(e as Map<String, dynamic>))
          .toList(),
  pagination: CategoriesPagination.fromJson(
    json['pagination'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$CategoriesDtoResponseToJson(
  CategoriesDtoResponse instance,
) => <String, dynamic>{
  'data': instance.data,
  'pagination': instance.pagination,
};

CategoriesData _$CategoriesDataFromJson(Map<String, dynamic> json) =>
    CategoriesData(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$CategoriesDataToJson(CategoriesData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
    };

CategoriesPagination _$CategoriesPaginationFromJson(
  Map<String, dynamic> json,
) => CategoriesPagination(total: (json['total'] as num).toInt());

Map<String, dynamic> _$CategoriesPaginationToJson(
  CategoriesPagination instance,
) => <String, dynamic>{'total': instance.total};
