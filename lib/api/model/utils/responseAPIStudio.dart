import 'package:json_annotation/json_annotation.dart';

import '../../../interface/model/utils/studioModel.dart';

part 'responseAPIStudio.g.dart';

@JsonSerializable()
class Studio {
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'id')
  final int? id;

  Studio(this.name, this.id);

  factory Studio.fromJson(Map<String, dynamic> json) => _$StudioFromJson(json);

  Map<String, dynamic> toJson() => _$StudioToJson(this);

  StudioModel getStudio() => StudioModel(name, id);
}
