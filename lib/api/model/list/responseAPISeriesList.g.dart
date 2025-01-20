// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'responseAPISeriesList.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OFFServerResponseSeriesList _$OFFServerResponseSeriesListFromJson(
        Map<String, dynamic> json) =>
    OFFServerResponseSeriesList(
      (json['results'] as List<dynamic>)
          .map((e) => OFFSeries.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['error'] as String,
    );

Map<String, dynamic> _$OFFServerResponseSeriesListToJson(
        OFFServerResponseSeriesList instance) =>
    <String, dynamic>{
      'results': instance.results,
      'error': instance.error,
    };

OFFSeries _$OFFSeriesFromJson(Map<String, dynamic> json) => OFFSeries(
      json['name'] as String?,
      json['image'] == null
          ? null
          : ImageURL.fromJson(json['image'] as Map<String, dynamic>),
      (json['id'] as num?)?.toInt(),
      (json['count_of_episodes'] as num?)?.toInt(),
      json['publisher'] == null
          ? null
          : Publisher.fromJson(json['publisher'] as Map<String, dynamic>),
      json['date_added'] == null
          ? null
          : DateTime.parse(json['date_added'] as String),
    );

Map<String, dynamic> _$OFFSeriesToJson(OFFSeries instance) => <String, dynamic>{
      'name': instance.name,
      'image': instance.image,
      'id': instance.id,
      'count_of_episodes': instance.count_of_episodes,
      'publisher': instance.publisher,
      'date_added': instance.date_added?.toIso8601String(),
    };
