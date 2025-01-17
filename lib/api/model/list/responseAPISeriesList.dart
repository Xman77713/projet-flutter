import 'package:flutter_projet_final/api/model/utils/responseAPIImageURL.dart';
import 'package:flutter_projet_final/api/model/utils/responseAPIPublisher.dart';
import 'package:flutter_projet_final/model/utils/imageUrlModel.dart';
import 'package:flutter_projet_final/model/utils/publisherModel.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../model/seriesListModel.dart';

part 'responseAPISeriesList.g.dart';

@JsonSerializable()
class OFFServerResponseSeriesList {
  @JsonKey(name: 'results')
  final List<OFFSeries> results;
  @JsonKey(name: 'error')
  final String error;

  OFFServerResponseSeriesList(this.results, this.error);

  factory OFFServerResponseSeriesList.fromJson(Map<String, dynamic> json) =>
      _$OFFServerResponseSeriesListFromJson(json);

  Map<String, dynamic> toJson() => _$OFFServerResponseSeriesListToJson(this);

  SeriesListModel getSeriesList() =>
      SeriesListModel(results.map((serie) => serie.getSerie()).toList());
}

@JsonSerializable()
class OFFSeries {
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'image')
  final ImageURL? image;
  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'count_of_episodes')
  final int? count_of_episodes;
  @JsonKey(name: 'publisher')
  final Publisher? publisher;
  @JsonKey(name: 'date_added')
  final DateTime? date_added;

  OFFSeries(this.name, this.image, this.id, this.count_of_episodes,
      this.publisher, this.date_added);

  factory OFFSeries.fromJson(Map<String, dynamic> json) =>
      _$OFFSeriesFromJson(json);

  Map<String, dynamic> toJson() => _$OFFSeriesToJson(this);

  SerieModel getSerie() => SerieModel(name, image?.getImageUrl(), id,
      count_of_episodes, publisher?.getPublisher(), date_added);
}
