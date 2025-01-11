// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'responseAPIIssuesList.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OFFServerResponseIssuesList _$OFFServerResponseIssuesListFromJson(
        Map<String, dynamic> json) =>
    OFFServerResponseIssuesList(
      (json['results'] as List<dynamic>?)
          ?.map((e) => OFFIssues.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['error'] as String?,
    );

Map<String, dynamic> _$OFFServerResponseIssuesListToJson(
        OFFServerResponseIssuesList instance) =>
    <String, dynamic>{
      'results': instance.results,
      'error': instance.error,
    };

OFFIssues _$OFFIssuesFromJson(Map<String, dynamic> json) => OFFIssues(
      json['name'] as String?,
      json['image'] == null
          ? null
          : ImageURL.fromJson(json['image'] as Map<String, dynamic>),
      (json['id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$OFFIssuesToJson(OFFIssues instance) => <String, dynamic>{
      'name': instance.name,
      'image': instance.image,
      'id': instance.id,
    };
