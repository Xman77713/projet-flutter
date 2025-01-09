// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'responseAPI.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OFFServerResponse _$OFFServerResponseFromJson(Map<String, dynamic> json) =>
    OFFServerResponse(
      OFFSeries.fromJson(json['response'] as Map<String, dynamic>),
      json['error'],
    );

Map<String, dynamic> _$OFFServerResponseToJson(OFFServerResponse instance) =>
    <String, dynamic>{
      'response': instance.response,
      'error': instance.error,
    };

OFFSeries _$OFFSeriesFromJson(Map<String, dynamic> json) => OFFSeries(
      json['name'] as String?,
      json['image'] as String?,
    );

Map<String, dynamic> _$OFFSeriesToJson(OFFSeries instance) => <String, dynamic>{
      'name': instance.name,
      'image': instance.image,
    };
