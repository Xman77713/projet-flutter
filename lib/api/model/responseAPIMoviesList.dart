import 'package:flutter_projet_final/api/model/responseAPIImageURL.dart';
import 'package:json_annotation/json_annotation.dart';

part 'responseAPIMoviesList.g.dart';

@JsonSerializable()
class OFFServerResponseMoviesList {
  @JsonKey(name: 'results')
  final List<OFFMovies>? results;
  @JsonKey(name: 'error')
  final String? error;

  OFFServerResponseMoviesList(this.results, this.error);

  factory OFFServerResponseMoviesList.fromJson(Map<String, dynamic> json) =>
      _$OFFServerResponseMoviesListFromJson(json);

  Map<String, dynamic> toJson() => _$OFFServerResponseMoviesListToJson(this);
}

@JsonSerializable()
class OFFMovies {
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'image')
  final ImageURL? image;

  OFFMovies(this.name, this.image);

  factory OFFMovies.fromJson(Map<String, dynamic> json) =>
      _$OFFMoviesFromJson(json);

  Map<String, dynamic> toJson() => _$OFFMoviesToJson(this);
}
