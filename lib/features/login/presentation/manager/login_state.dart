part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final LoginResponseBody response;

  LoginSuccess(this.response);
}

class LoginError extends LoginState {
  final String error;

  LoginError({required this.error});
}
