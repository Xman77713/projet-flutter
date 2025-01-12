import 'package:json_annotation/json_annotation.dart';

part 'responseAPIProducer.g.dart';

@JsonSerializable()
class Producer {
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'id')
  final int? id;

  Producer(this.name, this.id);

  factory Producer.fromJson(Map<String, dynamic> json) =>
      _$ProducerFromJson(json);

  Map<String, dynamic> toJson() => _$ProducerToJson(this);
}
