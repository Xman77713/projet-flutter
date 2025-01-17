import 'package:flutter_projet_final/model/utils/imageUrlModel.dart';
import 'package:json_annotation/json_annotation.dart';

part 'responseAPIImageURL.g.dart';

@JsonSerializable()
class ImageURL {
  @JsonKey(name: 'small_url')
  final String? smallUrl;
  @JsonKey(name: 'medium_url')
  final String? mediumUrl;

  ImageURL(this.smallUrl, this.mediumUrl);

  factory ImageURL.fromJson(Map<String, dynamic> json) =>
      _$ImageURLFromJson(json);

  Map<String, dynamic> toJson() => _$ImageURLToJson(this);

  ImageUrlModel getImageUrl() => ImageUrlModel(smallUrl, mediumUrl);
}
