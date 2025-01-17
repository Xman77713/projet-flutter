import 'package:json_annotation/json_annotation.dart';

import '../../../model/utils/personCreditsModel.dart';

part 'responseAPIPersonCredits.g.dart';

@JsonSerializable()
class PersonCredits {
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'role')
  final String? role;

  PersonCredits(this.name, this.id, this.role);

  factory PersonCredits.fromJson(Map<String, dynamic> json) =>
      _$PersonCreditsFromJson(json);

  Map<String, dynamic> toJson() => _$PersonCreditsToJson(this);

  PersonCreditsModel getPersonCredits() => PersonCreditsModel(name, id, role);
}
