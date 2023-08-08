import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:telkom_career/base/base_config.dart';
import 'package:telkom_career/domain/base/authentication_header_request.dart';
import 'package:telkom_career/domain/model/request/add_education/add_education.dart';

class EducationRemoteService {
  Client client = Client();
  Future<Response> addEducation(UpdateEducationRequest request,
      AuthenticationHeaderRequest header) async {
    final url = Uri.http(BaseConfig.BASE_DOMAIN_MOC,
        BaseConfig.BASE_PATH_MOC + BaseConfig.addeducation);
    return client.post(url, body: request.toJson(), headers: header.toHeader());
  }
}
