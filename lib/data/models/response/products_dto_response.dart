import 'package:json_annotation/json_annotation.dart';

part 'products_dto_response.g.dart';

@JsonSerializable()
class ProductsDtoResponse {
  final ProductsPagination pagination;

  ProductsDtoResponse({required this.pagination});

  factory ProductsDtoResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductsDtoResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProductsDtoResponseToJson(this);
}

@JsonSerializable()
class ProductsPagination {
  final int total;

  ProductsPagination({required this.total});

  factory ProductsPagination.fromJson(Map<String, dynamic> json) =>
      _$ProductsPaginationFromJson(json);

  Map<String, dynamic> toJson() => _$ProductsPaginationToJson(this);
}
