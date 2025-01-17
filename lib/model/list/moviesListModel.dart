import '../utils/imageUrlModel.dart';

class MoviesListModel {
  final List<MovieModel> moviesListModel;

  MoviesListModel(this.moviesListModel);
}

class MovieModel {
  final String? name;
  final ImageUrlModel? image;
  final int? id;
  final String? runtime;
  final DateTime? date_added;

  MovieModel(this.name, this.image, this.id, this.runtime, this.date_added);
}
