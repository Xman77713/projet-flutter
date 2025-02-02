import 'package:flutter_projet_final/interface/model/utils/writerModel.dart';
import 'package:json_annotation/json_annotation.dart';

part 'responseAPIWriter.g.dart';

@JsonSerializable()
class Writer {
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'id')
  final int? id;

  Writer(this.name, this.id);

  factory Writer.fromJson(Map<String, dynamic> json) => _$WriterFromJson(json);

  Map<String, dynamic> toJson() => _$WriterToJson(this);

  WriterModel getWriter() => WriterModel(name, id);
}
