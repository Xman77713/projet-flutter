// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'responseAPISeriesList.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OFFServerResponseSeriesList _$OFFServerResponseSeriesListFromJson(
        Map<String, dynamic> json) =>
    OFFServerResponseSeriesList(
      (json['results'] as List<dynamic>?)
          ?.map((e) => OFFSeries.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['error'] as String?,
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
    );

Map<String, dynamic> _$OFFSeriesToJson(OFFSeries instance) => <String, dynamic>{
      'name': instance.name,
      'image': instance.image,
      'id': instance.id,
    };
