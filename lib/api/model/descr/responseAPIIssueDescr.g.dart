// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'responseAPIIssueDescr.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OFFServerResponseIssueDescr _$OFFServerResponseIssueDescrFromJson(
        Map<String, dynamic> json) =>
    OFFServerResponseIssueDescr(
      json['results'] == null
          ? null
          : OFFIssueDescr.fromJson(json['results'] as Map<String, dynamic>),
      json['error'] as String?,
    );

Map<String, dynamic> _$OFFServerResponseIssueDescrToJson(
        OFFServerResponseIssueDescr instance) =>
    <String, dynamic>{
      'results': instance.results,
      'error': instance.error,
    };

OFFIssueDescr _$OFFIssueDescrFromJson(Map<String, dynamic> json) =>
    OFFIssueDescr(
      json['name'] as String?,
      json['image'] == null
          ? null
          : ImageURL.fromJson(json['image'] as Map<String, dynamic>),
      (json['id'] as num?)?.toInt(),
      json['runtime'] as String?,
      json['description'] as String?,
      (json['characters_credits'] as List<dynamic>?)
          ?.map((e) => Character.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['date_added'] as String?,
      (json['person_credits'] as List<dynamic>?)
          ?.map((e) => PersonCredits.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$OFFIssueDescrToJson(OFFIssueDescr instance) =>
    <String, dynamic>{
      'name': instance.name,
      'image': instance.image,
      'id': instance.id,
      'runtime': instance.runtime,
      'description': instance.description,
      'characters_credits': instance.characters_credits,
      'date_added': instance.date_added,
      'person_credits': instance.person_credits,
    };
