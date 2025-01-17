// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'responseAPIPersonDescr.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OFFServerResponsePersonDescr _$OFFServerResponsePersonDescrFromJson(
        Map<String, dynamic> json) =>
    OFFServerResponsePersonDescr(
      OFFPersonDescr.fromJson(json['results'] as Map<String, dynamic>),
      json['error'] as String,
    );

Map<String, dynamic> _$OFFServerResponsePersonDescrToJson(
        OFFServerResponsePersonDescr instance) =>
    <String, dynamic>{
      'results': instance.results,
      'error': instance.error,
    };

OFFPersonDescr _$OFFPersonDescrFromJson(Map<String, dynamic> json) =>
    OFFPersonDescr(
      json['name'] as String?,
      json['image'] == null
          ? null
          : ImageURL.fromJson(json['image'] as Map<String, dynamic>),
      (json['id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$OFFPersonDescrToJson(OFFPersonDescr instance) =>
    <String, dynamic>{
      'name': instance.name,
      'image': instance.image,
      'id': instance.id,
    };
