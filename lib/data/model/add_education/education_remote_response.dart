import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:telkom_career/domain/model/data/profile/education.dart';

part 'education_remote_response.g.dart';

abstract class EducationRemoteResponseMapper {
  UpdateEducation toUpdateEducation();
}

@JsonSerializable()
class EducationRemoteResponse implements EducationRemoteResponseMapper {
  String? id;
  String? profileId;
  EducationRemoteResponse({this.id, this.profileId});

  factory EducationRemoteResponse.fromJson(Map<String, dynamic> json) =>
      _$EducationRemoteResponseFromJson(json);

  Map<String, dynamic> toJson() => _$EducationRemoteResponseToJson(this);

  @override
  UpdateEducation toUpdateEducation() {
    return UpdateEducation(id ?? "", profileId ?? "");
  }
}
