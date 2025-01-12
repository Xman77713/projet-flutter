// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'responseAPIMoviesList.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OFFServerResponseMoviesList _$OFFServerResponseMoviesListFromJson(
        Map<String, dynamic> json) =>
    OFFServerResponseMoviesList(
      (json['results'] as List<dynamic>?)
          ?.map((e) => OFFMovies.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['error'] as String?,
    );

Map<String, dynamic> _$OFFServerResponseMoviesListToJson(
        OFFServerResponseMoviesList instance) =>
    <String, dynamic>{
      'results': instance.results,
      'error': instance.error,
    };

OFFMovies _$OFFMoviesFromJson(Map<String, dynamic> json) => OFFMovies(
      json['name'] as String?,
      json['image'] == null
          ? null
          : ImageURL.fromJson(json['image'] as Map<String, dynamic>),
      (json['id'] as num?)?.toInt(),
      json['runtime'] as String?,
      json['date_added'] == null
          ? null
          : DateTime.parse(json['date_added'] as String),
    );

Map<String, dynamic> _$OFFMoviesToJson(OFFMovies instance) => <String, dynamic>{
      'name': instance.name,
      'image': instance.image,
      'id': instance.id,
      'runtime': instance.runtime,
      'date_added': instance.date_added?.toIso8601String(),
    };
