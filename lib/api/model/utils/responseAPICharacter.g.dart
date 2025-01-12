// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'responseAPICharacter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Character _$CharacterFromJson(Map<String, dynamic> json) => Character(
      json['name'] as String?,
      (json['id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$CharacterToJson(Character instance) => <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
    };
