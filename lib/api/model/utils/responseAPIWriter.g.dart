// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'responseAPIWriter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Writer _$WriterFromJson(Map<String, dynamic> json) => Writer(
      json['name'] as String?,
      (json['id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$WriterToJson(Writer instance) => <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
    };
