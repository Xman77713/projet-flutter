// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'responseAPICharacterDescr.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OFFServerResponseCharacterDescr _$OFFServerResponseCharacterDescrFromJson(
        Map<String, dynamic> json) =>
    OFFServerResponseCharacterDescr(
      json['results'] == null
          ? null
          : OFFCharacterDescr.fromJson(json['results'] as Map<String, dynamic>),
      json['error'] as String?,
    );

Map<String, dynamic> _$OFFServerResponseCharacterDescrToJson(
        OFFServerResponseCharacterDescr instance) =>
    <String, dynamic>{
      'results': instance.results,
      'error': instance.error,
    };

OFFCharacterDescr _$OFFCharacterDescrFromJson(Map<String, dynamic> json) =>
    OFFCharacterDescr(
      json['name'] as String?,
      json['image'] == null
          ? null
          : ImageURL.fromJson(json['image'] as Map<String, dynamic>),
      (json['id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$OFFCharacterDescrToJson(OFFCharacterDescr instance) =>
    <String, dynamic>{
      'name': instance.name,
      'image': instance.image,
      'id': instance.id,
    };
