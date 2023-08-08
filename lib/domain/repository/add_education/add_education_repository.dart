import 'package:flutter/material.dart';
import 'package:telkom_career/base/result_entity.dart';
import 'package:telkom_career/domain/base/authentication_header_request.dart';
import 'package:telkom_career/domain/model/request/add_education/add_education.dart';

abstract class EducationRepository {
  Future<ResultEntity> addEducation(
      UpdateEducationRequest request, AuthenticationHeaderRequest header);
}
