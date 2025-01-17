import 'package:json_annotation/json_annotation.dart';

part 'responseAPIStudio.g.dart';

@JsonSerializable()
class Studio {
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'id')
  final int? id;

  Studio(this.name, this.id);

  factory Studio.fromJson(Map<String, dynamic> json) {
    return Studio(
      json['name'] as String? ?? 'Unknown Studio',
      json['id'] as int? ?? -1,
    );
  }

  Map<String, dynamic> toJson() => _$StudioToJson(this);
}
