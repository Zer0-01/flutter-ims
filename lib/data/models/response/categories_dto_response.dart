import 'package:json_annotation/json_annotation.dart';

part 'categories_dto_response.g.dart';

@JsonSerializable()
class CategoriesDtoResponse {
  final CategoriesPagination pagination;

  CategoriesDtoResponse({required this.pagination});

  factory CategoriesDtoResponse.fromJson(Map<String, dynamic> json) =>
      _$CategoriesDtoResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CategoriesDtoResponseToJson(this);
}

@JsonSerializable()
class CategoriesPagination {
  final int total;

  CategoriesPagination({required this.total});

  factory CategoriesPagination.fromJson(Map<String, dynamic> json) =>
      _$CategoriesPaginationFromJson(json);

  Map<String, dynamic> toJson() => _$CategoriesPaginationToJson(this);
}
