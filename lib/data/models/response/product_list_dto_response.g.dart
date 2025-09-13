// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_list_dto_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductListDtoResponse _$ProductListDtoResponseFromJson(
  Map<String, dynamic> json,
) => ProductListDtoResponse(
  data:
      (json['data'] as List<dynamic>)
          .map((e) => ProductListData.fromJson(e as Map<String, dynamic>))
          .toList(),
  pagination: ProductListPagination.fromJson(
    json['pagination'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$ProductListDtoResponseToJson(
  ProductListDtoResponse instance,
) => <String, dynamic>{
  'data': instance.data,
  'pagination': instance.pagination,
};

ProductListData _$ProductListDataFromJson(Map<String, dynamic> json) =>
    ProductListData(
      name: json['name'] as String,
      barcode: json['barcode'] as String,
      description: json['description'] as String,
      costPrice: (json['cost_price'] as num).toDouble(),
      sellingPrice: (json['selling_price'] as num).toDouble(),
    );

Map<String, dynamic> _$ProductListDataToJson(ProductListData instance) =>
    <String, dynamic>{
      'name': instance.name,
      'barcode': instance.barcode,
      'description': instance.description,
      'cost_price': instance.costPrice,
      'selling_price': instance.sellingPrice,
    };

ProductListPagination _$ProductListPaginationFromJson(
  Map<String, dynamic> json,
) => ProductListPagination(
  currentPage: (json['current_page'] as num).toInt(),
  perPage: (json['per_page'] as num).toInt(),
  totalRecords: (json['total_records'] as num).toInt(),
  totalPages: (json['total_pages'] as num).toInt(),
  hasNext: json['has_next'] as bool,
  hasPrev: json['has_prev'] as bool,
);

Map<String, dynamic> _$ProductListPaginationToJson(
  ProductListPagination instance,
) => <String, dynamic>{
  'current_page': instance.currentPage,
  'per_page': instance.perPage,
  'total_records': instance.totalRecords,
  'total_pages': instance.totalPages,
  'has_next': instance.hasNext,
  'has_prev': instance.hasPrev,
};
