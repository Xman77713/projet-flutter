import 'package:flutter_projet_final/api/model/utils/responseAPIImageURL.dart';
import 'package:flutter_projet_final/api/model/utils/responseAPIPublisher.dart';
import 'package:json_annotation/json_annotation.dart';

import '../utils/responseAPICharacter.dart';

part 'responseAPISerieDescr.g.dart';

@JsonSerializable()
class OFFServerResponseSerieDescr {
  @JsonKey(name: 'results')
  final OFFSerieDescr results;
  @JsonKey(name: 'error')
  final String error;

  OFFServerResponseSerieDescr(this.results, this.error);

  factory OFFServerResponseSerieDescr.fromJson(Map<String, dynamic> json) =>
      _$OFFServerResponseSerieDescrFromJson(json);

  Map<String, dynamic> toJson() => _$OFFServerResponseSerieDescrToJson(this);
}

@JsonSerializable()
class OFFSerieDescr {
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'image')
  final ImageURL? image;
  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'description')
  final String? description;
  @JsonKey(name: 'publisher')
  final Publisher? publisher;
  @JsonKey(name: 'count_of_episodes')
  final int? count_of_episodes;
  @JsonKey(name: 'characters')
  final List<Character>? characters;
  @JsonKey(name: 'date_added')
  final DateTime? date_added;

  OFFSerieDescr(
    this.name,
    this.image,
    this.id,
    this.description,
    this.publisher,
    this.count_of_episodes,
    this.characters,
    this.date_added,
  );

  factory OFFSerieDescr.fromJson(Map<String, dynamic> json) =>
      _$OFFSerieDescrFromJson(json);

  Map<String, dynamic> toJson() => _$OFFSerieDescrToJson(this);
}
