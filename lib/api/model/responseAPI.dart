import 'package:json_annotation/json_annotation.dart';

part 'responseAPI.g.dart';

@JsonSerializable()
class OFFServerResponse {
  @JsonKey(name: 'response')
  final OFFSeries response;
  @JsonKey(name: 'error')
  final dynamic error;

  OFFServerResponse(this.response, this.error);

  factory OFFServerResponse.fromJson(Map<String, dynamic> json) =>
      _$OFFServerResponseFromJson(json);

  Map<String, dynamic> toJson() => _$OFFServerResponseToJson(this);
}

@JsonSerializable()
class OFFSeries {
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'image')
  final String? image;

  OFFSeries(this.name, this.image);

  factory OFFSeries.fromJson(Map<String, dynamic> json) =>
      _$OFFSeriesFromJson(json);

  Map<String, dynamic> toJson() => _$OFFSeriesToJson(this);
}
