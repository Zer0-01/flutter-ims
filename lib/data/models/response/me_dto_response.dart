import 'package:json_annotation/json_annotation.dart';

part 'me_dto_response.g.dart';

@JsonSerializable()
class MeDtoResponse {
  final MeData data;

  MeDtoResponse(this.data);

  factory MeDtoResponse.fromJson(Map<String, dynamic> json) =>
      _$MeDtoResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MeDtoResponseToJson(this);
}

@JsonSerializable()
class MeData {
  final String name;

  MeData(this.name);

  factory MeData.fromJson(Map<String, dynamic> json) => _$MeDataFromJson(json);

  Map<String, dynamic> toJson() => _$MeDataToJson(this);
}
