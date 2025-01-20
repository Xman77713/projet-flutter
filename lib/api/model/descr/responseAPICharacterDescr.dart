import 'package:flutter_projet_final/api/model/utils/responseAPIImageURL.dart';
import 'package:json_annotation/json_annotation.dart';

part 'responseAPICharacterDescr.g.dart';

@JsonSerializable()
class OFFServerResponseCharacterDescr {
  @JsonKey(name: 'results')
  final OFFCharacterDescr results;
  @JsonKey(name: 'error')
  final String error;

  OFFServerResponseCharacterDescr(this.results, this.error);

  factory OFFServerResponseCharacterDescr.fromJson(Map<String, dynamic> json) =>
      _$OFFServerResponseCharacterDescrFromJson(json);

  Map<String, dynamic> toJson() =>
      _$OFFServerResponseCharacterDescrToJson(this);
}

@JsonSerializable()
class OFFCharacterDescr {
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'image')
  final ImageURL? image;
  @JsonKey(name: 'id')
  final int? id;

  OFFCharacterDescr(
    this.name,
    this.image,
    this.id,
  );

  factory OFFCharacterDescr.fromJson(Map<String, dynamic> json) =>
      _$OFFCharacterDescrFromJson(json);

  Map<String, dynamic> toJson() => _$OFFCharacterDescrToJson(this);
}
