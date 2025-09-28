// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_dto_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductsDtoResponse _$ProductsDtoResponseFromJson(Map<String, dynamic> json) =>
    ProductsDtoResponse(
      data:
          (json['data'] as List<dynamic>)
              .map((e) => ProductsData.fromJson(e as Map<String, dynamic>))
              .toList(),
      pagination: ProductsPagination.fromJson(
        json['pagination'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$ProductsDtoResponseToJson(
  ProductsDtoResponse instance,
) => <String, dynamic>{
  'data': instance.data,
  'pagination': instance.pagination,
};

ProductsData _$ProductsDataFromJson(Map<String, dynamic> json) => ProductsData(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  description: json['description'] as String,
  sku: json['sku'] as String,
  unit: json['unit'] as String,
  costPrice: (json['cost_price'] as num).toDouble(),
  sellingPrice: (json['selling_price'] as num).toDouble(),
);

Map<String, dynamic> _$ProductsDataToJson(ProductsData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'sku': instance.sku,
      'unit': instance.unit,
      'cost_price': instance.costPrice,
      'selling_price': instance.sellingPrice,
    };

ProductsPagination _$ProductsPaginationFromJson(Map<String, dynamic> json) =>
    ProductsPagination(total: (json['total'] as num).toInt());

Map<String, dynamic> _$ProductsPaginationToJson(ProductsPagination instance) =>
    <String, dynamic>{'total': instance.total};
