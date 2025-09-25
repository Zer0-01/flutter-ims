// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_dto_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductsDtoResponse _$ProductsDtoResponseFromJson(Map<String, dynamic> json) =>
    ProductsDtoResponse(
      pagination: ProductsPagination.fromJson(
        json['pagination'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$ProductsDtoResponseToJson(
  ProductsDtoResponse instance,
) => <String, dynamic>{'pagination': instance.pagination};

ProductsPagination _$ProductsPaginationFromJson(Map<String, dynamic> json) =>
    ProductsPagination(total: (json['total'] as num).toInt());

Map<String, dynamic> _$ProductsPaginationToJson(ProductsPagination instance) =>
    <String, dynamic>{'total': instance.total};
