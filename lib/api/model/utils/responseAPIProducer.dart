import 'package:json_annotation/json_annotation.dart';

import '../../../model/utils/producerModel.dart';

part 'responseAPIProducer.g.dart';

@JsonSerializable()
class Producer {
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'id')
  final int? id;

  Producer(this.name, this.id);

  factory Producer.fromJson(Map<String, dynamic> json) {
    return Producer(
      json['name'] as String? ?? 'Unknown Producer',
      json['id'] as int? ?? -1,
    );
  }

  Map<String, dynamic> toJson() => _$ProducerToJson(this);

  ProducerModel getProducer() => ProducerModel(name, id);
}
