import 'package:json_annotation/json_annotation.dart';

part 'create_category_dto_request.g.dart';

@JsonSerializable()
class CreateCategoryDtoRequest {
  final String name;
  final String description;

  const CreateCategoryDtoRequest({
    required this.name,
    required this.description,
  });

  factory CreateCategoryDtoRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateCategoryDtoRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CreateCategoryDtoRequestToJson(this);
}
