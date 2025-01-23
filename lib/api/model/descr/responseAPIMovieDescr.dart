import 'package:flutter_projet_final/api/model/utils/responseAPIImageURL.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../interface/model/descr/movieDescrModel.dart';
import '../../../interface/model/utils/characterModel.dart';
import '../../../interface/model/utils/producerModel.dart';
import '../../../interface/model/utils/studioModel.dart';
import '../utils/responseAPICharacter.dart';
import '../utils/responseAPIProducer.dart';
import '../utils/responseAPIStudio.dart';

part 'responseAPIMovieDescr.g.dart';

@JsonSerializable()
class OFFServerResponseMovieDescr {
  @JsonKey(name: 'results')
  final OFFMovieDescr results;
  @JsonKey(name: 'error')
  final String error;

  OFFServerResponseMovieDescr(this.results, this.error);

  factory OFFServerResponseMovieDescr.fromJson(Map<String, dynamic> json) =>
      _$OFFServerResponseMovieDescrFromJson(json);

  Map<String, dynamic> toJson() => _$OFFServerResponseMovieDescrToJson(this);

  MovieDescrModel getMovieDescr() => MovieDescrModel(results.getMovieD());
}

@JsonSerializable()
class OFFMovieDescr {
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'image')
  final ImageURL? image;
  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'runtime')
  final String? runtime;
  @JsonKey(name: 'description')
  final String? description;
  @JsonKey(name: 'characters')
  final List<Character>? characters;
  @JsonKey(name: 'date_added')
  final DateTime? date_added;
  @JsonKey(name: 'studios')
  final List<Studio>? studios;
  @JsonKey(name: 'producers')
  final List<Producer>? producers;
  @JsonKey(name: 'budget')
  final String? budget;
  @JsonKey(name: 'box_office_revenue')
  final String? box_office_revenue;

  OFFMovieDescr(
    this.name,
    this.image,
    this.id,
    this.runtime,
    this.description,
    this.characters,
    this.date_added,
    this.studios,
    this.producers,
    this.budget,
    this.box_office_revenue,
  );

  factory OFFMovieDescr.fromJson(Map<String, dynamic> json) =>
      _$OFFMovieDescrFromJson(json);

  Map<String, dynamic> toJson() => _$OFFMovieDescrToJson(this);

  ListCharacterModel getCharactersList() => ListCharacterModel(
      characters!.map((char) => char.getCharacter()).toList());

  ListStudiosModel getStudiosList() =>
      ListStudiosModel(studios!.map((stud) => stud.getStudio()).toList());

  ListProducersModel getProducersList() => ListProducersModel(
      producers!.map((produ) => produ.getProducer()).toList());

  MovieDModel getMovieD() => MovieDModel(
      name,
      image?.getImageUrl(),
      id,
      runtime,
      description,
      getCharactersList(),
      date_added,
      getStudiosList(),
      getProducersList(),
      budget,
      box_office_revenue);
}
