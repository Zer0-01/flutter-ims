import 'package:json_annotation/json_annotation.dart';

part 'request_dto_response.g.dart';

@JsonSerializable()
class RequestDtoResponse {
  final String name;
  final String email;
  final String password;

  RequestDtoResponse({
    required this.name,
    required this.email,
    required this.password,
  });

  factory RequestDtoResponse.fromJson(Map<String, dynamic> json) =>
      _$RequestDtoResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RequestDtoResponseToJson(this);
}
