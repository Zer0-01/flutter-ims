import 'package:json_annotation/json_annotation.dart';

part 'product_list_dto_response.g.dart';

@JsonSerializable()
class ProductListDtoResponse {
  final List<ProductListData> data;
  final ProductListPagination pagination;

  ProductListDtoResponse({required this.data, required this.pagination});

  factory ProductListDtoResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductListDtoResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProductListDtoResponseToJson(this);
}

@JsonSerializable()
class ProductListData {
  final String name;
  final String barcode;
  final String description;
  @JsonKey(name: 'cost_price')
  final double costPrice;
  @JsonKey(name: 'selling_price')
  final double sellingPrice;

  ProductListData({
    required this.name,
    required this.barcode,
    required this.description,
    required this.costPrice,
    required this.sellingPrice,
  });

  factory ProductListData.fromJson(Map<String, dynamic> json) =>
      _$ProductListDataFromJson(json);

  Map<String, dynamic> toJson() => _$ProductListDataToJson(this);
}

@JsonSerializable()
class ProductListPagination {
  @JsonKey(name: 'current_page')
  final int currentPage;
  @JsonKey(name: 'per_page')
  final int perPage;
  @JsonKey(name: 'total_records')
  final int totalRecords;
  @JsonKey(name: 'total_pages')
  final int totalPages;
  @JsonKey(name: 'has_next')
  final bool hasNext;
  @JsonKey(name: 'has_prev')
  final bool hasPrev;

  ProductListPagination({
    required this.currentPage,
    required this.perPage,
    required this.totalRecords,
    required this.totalPages,
    required this.hasNext,
    required this.hasPrev,
  });

  factory ProductListPagination.fromJson(Map<String, dynamic> json) =>
      _$ProductListPaginationFromJson(json);

  Map<String, dynamic> toJson() => _$ProductListPaginationToJson(this);
}
