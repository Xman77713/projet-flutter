import 'package:json_annotation/json_annotation.dart';

import '../../../interface/model/utils/nameComicsModel.dart';

part 'responseAPINameComics.g.dart';

@JsonSerializable()
class NameComics {
  @JsonKey(name: 'name')
  final String? name;

  NameComics(this.name);

  factory NameComics.fromJson(Map<String, dynamic> json) =>
      _$NameComicsFromJson(json);

  Map<String, dynamic> toJson() => _$NameComicsToJson(this);

  NameComicsModel getNameComics() => NameComicsModel(name);
}
