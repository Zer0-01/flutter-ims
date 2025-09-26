import 'package:json_annotation/json_annotation.dart';

part 'create_category_dto_request.g.dart';

@JsonSerializable()
class CreateCategoryDtoRequest {
  final String name;

  const CreateCategoryDtoRequest({required this.name});

  factory CreateCategoryDtoRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateCategoryDtoRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CreateCategoryDtoRequestToJson(this);
}
