part of 'education_cubit.dart';

abstract class EducationState extends Equatable {
  const EducationState();

  @override
  List<Object> get props => [];
}

class EducationInitial extends EducationState {}

class EducationIsSuccess extends EducationState {
  String? message;
  EducationIsSuccess({this.message});
}

class EducationIsFailed extends EducationState {
  String? message;
  EducationIsFailed({this.message});
}

class EducationIsLoading extends EducationState {}
