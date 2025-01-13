import 'package:flutter_projet_final/api/model/utils/responseAPIImageURL.dart';
import 'package:json_annotation/json_annotation.dart';

part 'responseAPIPersonDescr.g.dart';

@JsonSerializable()
class OFFServerResponsePersonDescr {
  @JsonKey(name: 'results')
  final OFFPersonDescr? results;
  @JsonKey(name: 'error')
  final String? error;

  OFFServerResponsePersonDescr(this.results, this.error);

  factory OFFServerResponsePersonDescr.fromJson(Map<String, dynamic> json) =>
      _$OFFServerResponsePersonDescrFromJson(json);

  Map<String, dynamic> toJson() => _$OFFServerResponsePersonDescrToJson(this);
}

@JsonSerializable()
class OFFPersonDescr {
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'image')
  final ImageURL? image;
  @JsonKey(name: 'id')
  final int? id;

  OFFPersonDescr(
    this.name,
    this.image,
    this.id,
  );

  factory OFFPersonDescr.fromJson(Map<String, dynamic> json) =>
      _$OFFPersonDescrFromJson(json);

  Map<String, dynamic> toJson() => _$OFFPersonDescrToJson(this);
}
