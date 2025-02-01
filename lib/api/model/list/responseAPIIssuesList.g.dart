// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'responseAPIIssuesList.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OFFServerResponseIssuesList _$OFFServerResponseIssuesListFromJson(
        Map<String, dynamic> json) =>
    OFFServerResponseIssuesList(
      (json['results'] as List<dynamic>)
          .map((e) => OFFIssues.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['error'] as String,
    );

Map<String, dynamic> _$OFFServerResponseIssuesListToJson(
        OFFServerResponseIssuesList instance) =>
    <String, dynamic>{
      'results': instance.results,
      'error': instance.error,
    };

OFFIssues _$OFFIssuesFromJson(Map<String, dynamic> json) => OFFIssues(
      json['volume'] == null
          ? null
          : NameComics.fromJson(json['volume'] as Map<String, dynamic>),
      json['image'] == null
          ? null
          : ImageURL.fromJson(json['image'] as Map<String, dynamic>),
      (json['id'] as num?)?.toInt(),
      json['issue_number'] as String?,
      json['cover_date'] == null
          ? null
          : DateTime.parse(json['cover_date'] as String),
      json['name'] as String?,
    );

Map<String, dynamic> _$OFFIssuesToJson(OFFIssues instance) => <String, dynamic>{
      'volume': instance.name,
      'image': instance.image,
      'id': instance.id,
      'issue_number': instance.issue_number,
      'cover_date': instance.date_added?.toIso8601String(),
      'name': instance.nameSaga,
    };
