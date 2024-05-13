import 'package:educate/features/login/data/models/Login_request_body.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/services/api/api_service.dart';
import '../../data/models/login_response_body.dart';

part 'login_state.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  final ApiService _apiService;

  LoginCubit(this._apiService) : super(LoginInitial());

  Future<void> login(LoginRequestBody loginRequestBody) async {
    emit(LoginLoading());
    try {
      final response = await _apiService.login(loginRequestBody);

      emit(LoginSuccess(response));
    } on Exception catch (e) {
      emit(LoginError(error: e.toString()));
    }
  }
}
