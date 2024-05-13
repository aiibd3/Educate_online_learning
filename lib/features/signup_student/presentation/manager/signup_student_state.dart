part of 'signup_student_cubit.dart';

@immutable
sealed class SignupStudentState {}

final class SignupStudentInitial extends SignupStudentState {}

final class SignupStudentLoading extends SignupStudentState {}

final class SignupStudentSuccess extends SignupStudentState {
  final SignupStudentResponseBody response;

  SignupStudentSuccess(this.response);
}

final class SignupStudentError extends SignupStudentState {
  final String error;

  SignupStudentError({required this.error});
}
