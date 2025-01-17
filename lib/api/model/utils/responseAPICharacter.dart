import 'package:json_annotation/json_annotation.dart';

part 'responseAPICharacter.g.dart';

@JsonSerializable()
class Character {
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'id')
  final int? id;

  Character(this.name, this.id);

  factory Character.fromJson(Map<String, dynamic> json) =>
      _$CharacterFromJson(json);

  Map<String, dynamic> toJson() => _$CharacterToJson(this);
}
