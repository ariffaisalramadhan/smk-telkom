// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_education.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateEducationRequest _$UpdateEducationRequestFromJson(
        Map<String, dynamic> json) =>
    UpdateEducationRequest(
      level: json['level'] as String?,
      name: json['name'] as String?,
      major: json['major'] as String?,
      stillEducation: json['stillEducation'] as String?,
      startEducation: json['startEducation'] as String?,
      endEducation: json['endEducation'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$UpdateEducationRequestToJson(
        UpdateEducationRequest instance) =>
    <String, dynamic>{
      'level': instance.level,
      'name': instance.name,
      'major': instance.major,
      'stillEducation': instance.stillEducation,
      'startEducation': instance.startEducation,
      'endEducation': instance.endEducation,
      'description': instance.description,
    };
