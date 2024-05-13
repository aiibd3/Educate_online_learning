import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/services/api/api_service.dart';
import '../../data/models/signup_instructor_request_body.dart';
import '../../data/models/signup_instructor_response_body.dart';

part 'signup_instructor_state.dart';

@injectable
class SignupInstructorCubit extends Cubit<SignupInstructorState> {
  final ApiService _apiService;

  SignupInstructorCubit(this._apiService) : super(SignupInstructorInitial());

  Future<void> signup   (SignupInstructorRequestBody signupRequestBody) async {
    emit(SignupInstructorLoading());
    try {
      final response = await _apiService.signupInstructor(signupRequestBody);
      emit(SignupInstructorSuccess(response));
    } on Exception catch (e) {
      emit(SignupInstructorError(error: e.toString()));
    }
  }
}
