// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_product_dto_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateProductDtoRequest _$CreateProductDtoRequestFromJson(
  Map<String, dynamic> json,
) => CreateProductDtoRequest(
  name: json['name'] as String,
  sku: json['sku'] as String,
  categoryId: (json['category_id'] as num).toInt(),
  costPrice: (json['cost_price'] as num).toDouble(),
  sellingPrice: (json['selling_price'] as num).toDouble(),
  description: json['description'] as String,
  unit: json['unit'] as String,
);

Map<String, dynamic> _$CreateProductDtoRequestToJson(
  CreateProductDtoRequest instance,
) => <String, dynamic>{
  'name': instance.name,
  'sku': instance.sku,
  'category_id': instance.categoryId,
  'cost_price': instance.costPrice,
  'selling_price': instance.sellingPrice,
  'description': instance.description,
  'unit': instance.unit,
};
