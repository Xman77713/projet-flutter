import 'package:json_annotation/json_annotation.dart';

part 'responseAPI.g.dart';

@JsonSerializable()
class OFFServerResponse {
  @JsonKey(name: 'response')
  final OFFResponse response;
  @JsonKey(name: 'error')
  final dynamic error;

  OFFServerResponse(this.response, this.error);

  factory OFFServerResponse.fromJson(Map<String, dynamic> json) =>
      _$OFFServerResponseFromJson(json);

  Map<String, dynamic> toJson() => _$OFFServerResponseToJson(this);
}

@JsonSerializable()
class OFFResponse {
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'altName')
  final String? altName;

  OFFResponse(this.name, this.altName);

  factory OFFResponse.fromJson(Map<String, dynamic> json) =>
      _$OFFResponseFromJson(json);

  Map<String, dynamic> toJson() => _$OFFResponseToJson(this);
}
