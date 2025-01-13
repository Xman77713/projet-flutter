import 'package:flutter_projet_final/api/model/utils/responseAPIImageURL.dart';
import 'package:json_annotation/json_annotation.dart';

import '../utils/responseAPICharacter.dart';
import '../utils/responseAPIPersonCredits.dart';

part 'responseAPIIssueDescr.g.dart';

@JsonSerializable()
class OFFServerResponseIssueDescr {
  @JsonKey(name: 'results')
  final OFFIssueDescr? results;
  @JsonKey(name: 'error')
  final String? error;

  OFFServerResponseIssueDescr(this.results, this.error);

  factory OFFServerResponseIssueDescr.fromJson(Map<String, dynamic> json) =>
      _$OFFServerResponseIssueDescrFromJson(json);

  Map<String, dynamic> toJson() => _$OFFServerResponseIssueDescrToJson(this);
}

@JsonSerializable()
class OFFIssueDescr {
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
  @JsonKey(name: 'characters_credits')
  final List<Character>? characters_credits;
  @JsonKey(name: 'date_added')
  final String? date_added;
  @JsonKey(name: 'person_credits')
  final List<PersonCredits>? person_credits;

  OFFIssueDescr(
    this.name,
    this.image,
    this.id,
    this.runtime,
    this.description,
    this.characters_credits,
    this.date_added,
    this.person_credits,
  );

  factory OFFIssueDescr.fromJson(Map<String, dynamic> json) =>
      _$OFFIssueDescrFromJson(json);

  Map<String, dynamic> toJson() => _$OFFIssueDescrToJson(this);
}
