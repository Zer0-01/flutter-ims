import 'package:json_annotation/json_annotation.dart';

part 'create_product_dto_request.g.dart';

@JsonSerializable()
class CreateProductDtoRequest {
  final String name;
  final String sku;
  @JsonKey(name: 'category_id')
  final int categoryId;
  @JsonKey(name: 'cost_price')
  final double costPrice;
  @JsonKey(name: 'selling_price')
  final double sellingPrice;

  CreateProductDtoRequest({
    required this.name,
    required this.sku,
    required this.categoryId,
    required this.costPrice,
    required this.sellingPrice,
  });

  factory CreateProductDtoRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateProductDtoRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CreateProductDtoRequestToJson(this);
}
