import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:telkom_career/base/login_moc/base_remote_response.dart';
import 'package:telkom_career/base/result_entity.dart';
import 'package:telkom_career/data/service/remote/education/education_remote_service.dart';
import 'package:telkom_career/domain/base/authentication_header_request.dart';
import 'package:telkom_career/domain/model/data/profile/education.dart';
import 'package:telkom_career/domain/model/request/add_education/add_education.dart';
import 'package:telkom_career/domain/repository/add_education/add_education_repository.dart';

class UpdateEducationRepositoryImpl implements EducationRepository {
  final addEducationRemoteService = EducationRemoteService();

  @override
  Future<ResultEntity<UpdateEducation>> addEducation(
      UpdateEducationRequest request,
      AuthenticationHeaderRequest header) async {
    try {
      final response =
          await addEducationRemoteService.addEducation(request, header);
      if (response.statusCode == 200) {
        BaseRemoteResponseMoc baseResponseeObject =
            BaseRemoteResponseMoc.fromJson(
                jsonDecode(response.body), (json) => null);
        if (baseResponseeObject.status == null) {
          return ResultError(message: baseResponseeObject.status!.message);
        } else if (baseResponseeObject.status?.code != 0) {
          return ResultError(message: baseResponseeObject.status!.message);
        } else {
          return ResultSuccess(baseResponseeObject.data);
        }
      } else {
        return ResultError(message: "");
      }
    } catch (error) {
      return ResultError(message: "");
    }
  }
}
