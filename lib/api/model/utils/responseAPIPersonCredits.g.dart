// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'responseAPIPersonCredits.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PersonCredits _$PersonCreditsFromJson(Map<String, dynamic> json) =>
    PersonCredits(
      json['name'] as String?,
      (json['id'] as num?)?.toInt(),
      json['role'] as String?,
    );

Map<String, dynamic> _$PersonCreditsToJson(PersonCredits instance) =>
    <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'role': instance.role,
    };
