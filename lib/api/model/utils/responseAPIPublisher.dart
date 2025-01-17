import 'package:flutter_projet_final/model/utils/publisherModel.dart';
import 'package:json_annotation/json_annotation.dart';

part 'responseAPIPublisher.g.dart';

@JsonSerializable()
class Publisher {
  @JsonKey(name: 'name')
  final String? name;

  Publisher(this.name);

  factory Publisher.fromJson(Map<String, dynamic> json) =>
      _$PublisherFromJson(json);

  Map<String, dynamic> toJson() => _$PublisherToJson(this);

  PublisherModel getPublisher() => PublisherModel(name);
}
