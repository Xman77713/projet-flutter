// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'responseAPIMovieDescr.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OFFServerResponseMovieDescr _$OFFServerResponseMovieDescrFromJson(
        Map<String, dynamic> json) =>
    OFFServerResponseMovieDescr(
      OFFMovieDescr.fromJson(json['results'] as Map<String, dynamic>),
      json['error'] as String,
    );

Map<String, dynamic> _$OFFServerResponseMovieDescrToJson(
        OFFServerResponseMovieDescr instance) =>
    <String, dynamic>{
      'results': instance.results,
      'error': instance.error,
    };

OFFMovieDescr _$OFFMovieDescrFromJson(Map<String, dynamic> json) =>
    OFFMovieDescr(
      json['name'] as String?,
      json['image'] == null
          ? null
          : ImageURL.fromJson(json['image'] as Map<String, dynamic>),
      (json['id'] as num?)?.toInt(),
      json['runtime'] as String?,
      json['description'] as String?,
      (json['characters'] as List<dynamic>?)
          ?.map((e) => Character.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['release_date'] == null
          ? null
          : DateTime.parse(json['release_date'] as String),
      (json['studios'] as List<dynamic>?)
          ?.map((e) => Studio.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['producers'] as List<dynamic>?)
          ?.map((e) => Producer.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['budget'] as String?,
      json['box_office_revenue'] as String?,
      json['rating'] as String?,
      (json['writers'] as List<dynamic>?)
          ?.map((e) => Writer.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['total_revenue'] as String?,
    );

Map<String, dynamic> _$OFFMovieDescrToJson(OFFMovieDescr instance) =>
    <String, dynamic>{
      'name': instance.name,
      'image': instance.image,
      'id': instance.id,
      'runtime': instance.runtime,
      'description': instance.description,
      'characters': instance.characters,
      'release_date': instance.date_added?.toIso8601String(),
      'studios': instance.studios,
      'producers': instance.producers,
      'budget': instance.budget,
      'box_office_revenue': instance.box_office_revenue,
      'rating': instance.rating,
      'writers': instance.writers,
      'total_revenue': instance.total_revenue,
    };
