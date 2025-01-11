import 'package:json_annotation/json_annotation.dart';

part 'responseAPIImageURL.g.dart';

@JsonSerializable()
class ImageURL {
  @JsonKey(name: 'small_url')
  final String? smallUrl;

  ImageURL(this.smallUrl);

  factory ImageURL.fromJson(Map<String, dynamic> json) =>
      _$ImageURLFromJson(json);

  Map<String, dynamic> toJson() => _$ImageURLToJson(this);
}
