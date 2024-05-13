import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/services/api/api_service.dart';
import '../../../data/models/create/Create_course_Request_body.dart';
import '../../../data/models/create/Create_course_response_body.dart';
import '../../../data/models/search/search_response_body.dart';
part 'home_instructor_state.dart';


@injectable
class HomeInstructorCubit extends Cubit<HomeInstructorState> {
  final ApiService _apiService;

  HomeInstructorCubit(this._apiService) : super(HomeInstructorInitial());

  Future<void> createCourse(
      CreateCourseRequestBody createCourseRequestBody) async {
    emit(HomeInstructorLoading());
    try {
      final response = await _apiService.createCourse(createCourseRequestBody);
      emit(HomeInstructorSuccess(response));
    } on Exception catch (e) {
      emit(
        HomeInstructorError(
          message: e.toString(),
        ),
      );
    }
  }

  Future<void> searchCourse(String nameCourse) async {
    emit(HomeInstructorLoading());
    try {
      final response = await _apiService.searchName(nameCourse);
      emit(HomeInstructorSearchSuccess(response));
    } on Exception catch (e) {
      emit(
        HomeInstructorError(
          message: e.toString(),
        ),
      );
    }
  }
}
