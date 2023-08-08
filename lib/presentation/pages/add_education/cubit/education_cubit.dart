import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:telkom_career/base/result_entity.dart';
import 'package:telkom_career/data/utilities/commons.dart';
import 'package:telkom_career/domain/base/authentication_header_request.dart';
import 'package:telkom_career/domain/model/request/add_education/add_education.dart';
import 'package:telkom_career/domain/repository/add_education/add_education_repository.dart';

part 'education_state.dart';

class EducationCubit extends Cubit<EducationState> {
  final EducationRepository repository;
  EducationCubit(
    this.repository,
  ) : super(EducationInitial());

  Future<void> onAddEducation(UpdateEducationRequest request) async {
    emit(EducationIsLoading());
    final token = await Commons().getUid();
    final response = await repository.addEducation(
        request, AuthenticationHeaderRequest(token));
    if (response is ResultSuccess) {
      emit(EducationIsSuccess(message: "Update pendidikan berhasil"));
      final token = (response).data;
      print(token);
    } else {
      emit(EducationIsFailed(message: (response as ResultError).message));
    }
  }
}
