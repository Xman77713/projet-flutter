import '../utils/imageUrlModel.dart';
import '../utils/publisherModel.dart';

class SeriesListModel {
  final List<SerieModel> seriesListModel;

  SeriesListModel(this.seriesListModel);
}

class SerieModel {
  final String? name;
  final ImageUrlModel? image;
  final int? id;
  final int? count_of_episodes;
  final PublisherModel? publisher;
  final DateTime? date_added;

  SerieModel(this.name, this.image, this.id, this.count_of_episodes,
      this.publisher, this.date_added);
}

class SeriesListModelHP {
  final List<SerieModelHP> seriesListModelHP;

  SeriesListModelHP(this.seriesListModelHP);
}

class SerieModelHP {
  final String? name;
  final ImageUrlModel? image;

  SerieModelHP(this.name, this.image);
}
