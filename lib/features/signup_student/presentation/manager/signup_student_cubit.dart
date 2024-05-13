

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/services/api/api_service.dart';
import '../../data/models/signup_student_request_body.dart';
import '../../data/models/signup_student_response_body.dart';

part 'signup_student_state.dart';

@injectable
class SignupStudentCubit extends Cubit<SignupStudentState> {
  final ApiService _apiService;
  SignupStudentCubit(this._apiService) : super(SignupStudentInitial());

  Future<void> signupS(SignupStudentRequestBody signupRequestBody) async {
    emit(SignupStudentLoading());
    try {
      final response = await _apiService.signupStudent(signupRequestBody);
      emit(SignupStudentSuccess(response));
    } on Exception catch (e) {
      emit(SignupStudentError(error: e.toString()));
    }
  }
}
