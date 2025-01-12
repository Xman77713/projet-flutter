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
      json['description'] as String?,
      json['publisher'] == null
          ? null
          : Publisher.fromJson(json['publisher'] as Map<String, dynamic>),
      (json['count_of_episodes'] as num?)?.toInt(),
      (json['characters'] as List<dynamic>?)
          ?.map((e) => Character.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['date_added'] as String?,
    );

Map<String, dynamic> _$OFFSerieDescrToJson(OFFSerieDescr instance) =>
    <String, dynamic>{
      'name': instance.name,
      'image': instance.image,
      'id': instance.id,
      'description': instance.description,
      'publisher': instance.publisher,
      'count_of_episodes': instance.count_of_episodes,
      'characters': instance.characters,
      'date_added': instance.date_added,
    };
