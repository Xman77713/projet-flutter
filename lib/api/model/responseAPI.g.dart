// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'responseAPI.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OFFServerResponse _$OFFServerResponseFromJson(Map<String, dynamic> json) =>
    OFFServerResponse(
      OFFResponse.fromJson(json['response'] as Map<String, dynamic>),
      json['error'],
    );

Map<String, dynamic> _$OFFServerResponseToJson(OFFServerResponse instance) =>
    <String, dynamic>{
      'response': instance.response,
      'error': instance.error,
    };

OFFResponse _$OFFResponseFromJson(Map<String, dynamic> json) => OFFResponse(
      json['name'] as String?,
      json['altName'] as String?,
    );

Map<String, dynamic> _$OFFResponseToJson(OFFResponse instance) =>
    <String, dynamic>{
      'name': instance.name,
      'altName': instance.altName,
    };
