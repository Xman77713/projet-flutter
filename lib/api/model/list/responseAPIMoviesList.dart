import 'package:flutter_projet_final/api/model/utils/responseAPIImageURL.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../interface/model/list/moviesListModel.dart';

part 'responseAPIMoviesList.g.dart';

@JsonSerializable()
class OFFServerResponseMoviesList {
  @JsonKey(name: 'results')
  final List<OFFMovies> results;
  @JsonKey(name: 'error')
  final String error;

  OFFServerResponseMoviesList(this.results, this.error);

  factory OFFServerResponseMoviesList.fromJson(Map<String, dynamic> json) =>
      _$OFFServerResponseMoviesListFromJson(json);

  Map<String, dynamic> toJson() => _$OFFServerResponseMoviesListToJson(this);

  MoviesListModel getMoviesList() =>
      MoviesListModel(results.map((movie) => movie.getMovie()).toList());

  MoviesListModelHP getMoviesListHP() =>
      MoviesListModelHP(results.map((movie) => movie.getMovieHP()).toList());
}

@JsonSerializable()
class OFFMovies {
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'image')
  final ImageURL? image;
  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'runtime')
  final String? runtime;
  @JsonKey(name: 'release_date')
  final DateTime? date_added;

  OFFMovies(this.name, this.image, this.id, this.runtime, this.date_added);

  factory OFFMovies.fromJson(Map<String, dynamic> json) =>
      _$OFFMoviesFromJson(json);

  Map<String, dynamic> toJson() => _$OFFMoviesToJson(this);

  MovieModel getMovie() =>
      MovieModel(name, image?.getImageUrl(), id, runtime, date_added);

  MoviesModelHP getMovieHP() => MoviesModelHP(name, image?.getImageUrl(), id);
}
