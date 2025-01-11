import 'package:flutter_projet_final/api/model/responseAPIImageURL.dart';
import 'package:json_annotation/json_annotation.dart';

part 'responseAPISeriesList.g.dart';

@JsonSerializable()
class OFFServerResponseSeriesList {
  @JsonKey(name: 'results')
  final List<OFFSeries>? results;
  @JsonKey(name: 'error')
  final String? error;

  OFFServerResponseSeriesList(this.results, this.error);

  factory OFFServerResponseSeriesList.fromJson(Map<String, dynamic> json) =>
      _$OFFServerResponseSeriesListFromJson(json);

  Map<String, dynamic> toJson() => _$OFFServerResponseSeriesListToJson(this);
}

@JsonSerializable()
class OFFSeries {
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'image')
  final ImageURL? image;

  OFFSeries(this.name, this.image);

  factory OFFSeries.fromJson(Map<String, dynamic> json) =>
      _$OFFSeriesFromJson(json);

  Map<String, dynamic> toJson() => _$OFFSeriesToJson(this);
}
