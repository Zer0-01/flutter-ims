import 'package:json_annotation/json_annotation.dart';

part 'categories_dto_response.g.dart';

@JsonSerializable()
class CategoriesDtoResponse {
  final List<CategoriesData> data;
  final CategoriesPagination pagination;

  CategoriesDtoResponse({required this.data, required this.pagination});

  factory CategoriesDtoResponse.fromJson(Map<String, dynamic> json) =>
      _$CategoriesDtoResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CategoriesDtoResponseToJson(this);
}

@JsonSerializable()
class CategoriesData {
  final int id;
  final String name;
  final String? description;

  CategoriesData({required this.id, required this.name, this.description});

  factory CategoriesData.fromJson(Map<String, dynamic> json) =>
      _$CategoriesDataFromJson(json);

  Map<String, dynamic> toJson() => _$CategoriesDataToJson(this);
}

@JsonSerializable()
class CategoriesPagination {
  final int total;

  CategoriesPagination({required this.total});

  factory CategoriesPagination.fromJson(Map<String, dynamic> json) =>
      _$CategoriesPaginationFromJson(json);

  Map<String, dynamic> toJson() => _$CategoriesPaginationToJson(this);
}
