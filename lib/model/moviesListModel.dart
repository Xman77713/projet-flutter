import 'utils/imageUrlModel.dart';
import 'utils/publisherModel.dart';

class MoviesListModel {
  final List<MovieModel> moviesListModel;

  MoviesListModel(this.moviesListModel);
}

class MovieModel {
  final String? name;
  final ImageUrlModel? image;
  final int? id;
  final int? count_of_episodes;
  final PublisherModel? publisher;
  final DateTime? date_added;

  MovieModel(this.name, this.image, this.id, this.count_of_episodes,
      this.publisher, this.date_added);
}
