import 'package:flutter_projet_final/model/utils/characterModel.dart';
import 'package:flutter_projet_final/model/utils/producerModel.dart';
import 'package:flutter_projet_final/model/utils/studioModel.dart';

import '../utils/imageUrlModel.dart';

class MovieDescrModel {
  final MovieDModel movieDModel;

  MovieDescrModel(this.movieDModel);
}


class MovieDModel {
  final String? name;
  final ImageUrlModel? image;
  final int? id;
  final String? runtime;
  final String? description;
  final List<CharacterModel>? characters;
  final DateTime? date_added;
  final List<StudioModel>? studios;
  final List<ProducerModel>? producers;
  final String? budget;
  final String? box_office_revenue;

  MovieDModel(this.name,
      this.image,
      this.id,
      this.runtime,
      this.description,
      this.characters,
      this.date_added,
      this.studios,
      this.producers,
      this.budget,
      this.box_office_revenue);

  ImageUrlModel getImageUrl() =>
      ImageUrlModel(image?.mediumUrl, image?.smallUrl);
}
