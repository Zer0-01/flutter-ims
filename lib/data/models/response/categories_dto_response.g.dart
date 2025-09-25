// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categories_dto_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoriesDtoResponse _$CategoriesDtoResponseFromJson(
  Map<String, dynamic> json,
) => CategoriesDtoResponse(
  pagination: CategoriesPagination.fromJson(
    json['pagination'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$CategoriesDtoResponseToJson(
  CategoriesDtoResponse instance,
) => <String, dynamic>{'pagination': instance.pagination};

CategoriesPagination _$CategoriesPaginationFromJson(
  Map<String, dynamic> json,
) => CategoriesPagination(total: (json['total'] as num).toInt());

Map<String, dynamic> _$CategoriesPaginationToJson(
  CategoriesPagination instance,
) => <String, dynamic>{'total': instance.total};
