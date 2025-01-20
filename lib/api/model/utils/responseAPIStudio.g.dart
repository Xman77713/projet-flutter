// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'responseAPIStudio.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Studio _$StudioFromJson(Map<String, dynamic> json) => Studio(
      json['name'] as String?,
      (json['id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$StudioToJson(Studio instance) => <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
    };
