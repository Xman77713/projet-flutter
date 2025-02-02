import 'package:json_annotation/json_annotation.dart';

import '../../../interface/model/utils/producerModel.dart';

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

  ProducerModel getProducer() => ProducerModel(name, id);
}

// factory PersonCredits.fromJson(Map<String, dynamic> json) =>
// _$PersonCreditsFromJson(json);
//
// Map<String, dynamic> toJson() => _$PersonCreditsToJson(this);
