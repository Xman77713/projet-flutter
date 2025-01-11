// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'responseAPISerieDescr.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OFFServerResponseSerieDescr _$OFFServerResponseSerieDescrFromJson(
        Map<String, dynamic> json) =>
    OFFServerResponseSerieDescr(
      json['results'] == null
          ? null
          : OFFSerieDescr.fromJson(json['results'] as Map<String, dynamic>),
      json['error'] as String?,
    );

Map<String, dynamic> _$OFFServerResponseSerieDescrToJson(
        OFFServerResponseSerieDescr instance) =>
    <String, dynamic>{
      'results': instance.results,
      'error': instance.error,
    };

OFFSerieDescr _$OFFSerieDescrFromJson(Map<String, dynamic> json) =>
    OFFSerieDescr(
      json['name'] as String?,
      json['image'] == null
          ? null
          : ImageURL.fromJson(json['image'] as Map<String, dynamic>),
      (json['id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$OFFSerieDescrToJson(OFFSerieDescr instance) =>
    <String, dynamic>{
      'name': instance.name,
      'image': instance.image,
      'id': instance.id,
    };
