import 'package:json_annotation/json_annotation.dart';

part 'products_dto_response.g.dart';

@JsonSerializable()
class ProductsDtoResponse {
  final List<ProductsData> data;
  final ProductsPagination pagination;

  ProductsDtoResponse({required this.data, required this.pagination});

  factory ProductsDtoResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductsDtoResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProductsDtoResponseToJson(this);
}

@JsonSerializable()
class ProductsData {
  final int id;
  final String name;
  final String description;
  final String sku;
  final String unit;
  @JsonKey(name: 'cost_price')
  final double costPrice;
  @JsonKey(name: 'selling_price')
  final double sellingPrice;

  ProductsData({
    required this.id,
    required this.name,
    required this.description,
    required this.sku,
    required this.unit,
    required this.costPrice,
    required this.sellingPrice,
  });

  factory ProductsData.fromJson(Map<String, dynamic> json) =>
      _$ProductsDataFromJson(json);

  Map<String, dynamic> toJson() => _$ProductsDataToJson(this);
}

@JsonSerializable()
class ProductsPagination {
  final int total;

  ProductsPagination({required this.total});

  factory ProductsPagination.fromJson(Map<String, dynamic> json) =>
      _$ProductsPaginationFromJson(json);

  Map<String, dynamic> toJson() => _$ProductsPaginationToJson(this);
}
