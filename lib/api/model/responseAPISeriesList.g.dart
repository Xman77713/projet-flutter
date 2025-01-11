// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'responseAPISeriesList.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OFFServerResponse _$OFFServerResponseFromJson(Map<String, dynamic> json) =>
    OFFServerResponse(
      (json['results'] as List<dynamic>?)
          ?.map((e) => OFFSeries.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['error'] as String?,
    );

Map<String, dynamic> _$OFFServerResponseToJson(OFFServerResponse instance) =>
    <String, dynamic>{
      'results': instance.results,
      'error': instance.error,
    };

OFFSeries _$OFFSeriesFromJson(Map<String, dynamic> json) => OFFSeries(
      json['name'] as String?,
      json['image'] == null
          ? null
          : ImageURL.fromJson(json['image'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OFFSeriesToJson(OFFSeries instance) => <String, dynamic>{
      'name': instance.name,
      'image': instance.image,
    };
