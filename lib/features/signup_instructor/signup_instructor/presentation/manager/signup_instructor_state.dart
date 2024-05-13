part of 'signup_instructor_cubit.dart';

@immutable
sealed class SignupInstructorState {}

final class SignupInstructorInitial extends SignupInstructorState {}

final class SignupInstructorLoading extends SignupInstructorState {}

final class SignupInstructorSuccess extends SignupInstructorState {
  final SignupInstructorResponseBody response;

  SignupInstructorSuccess(this.response);
}

final class SignupInstructorError extends SignupInstructorState {
  final String error;

  SignupInstructorError({required this.error});
}
