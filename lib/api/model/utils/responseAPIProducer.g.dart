// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'responseAPIProducer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Producer _$ProducerFromJson(Map<String, dynamic> json) => Producer(
      json['name'] as String?,
      (json['id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ProducerToJson(Producer instance) => <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
    };
