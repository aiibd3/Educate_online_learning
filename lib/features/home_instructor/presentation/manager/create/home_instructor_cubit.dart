import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/models/searchCategory/search_category_response_body.dart'
    as gt;
import '../../../../../core/models/searchName/search_response_body.dart' as sr;
import '../../../../../core/services/api/api_service.dart';
import '../../../data/models/create/Create_course_Request_body.dart';
import '../../../data/models/create/Create_course_response_body.dart';
import '../../../data/models/get_my_courses/get_courses_response_body.dart';

part 'home_instructor_state.dart';

@injectable
class HomeInstructorCubit extends Cubit<HomeInstructorState> {
  final ApiService _apiService;

  HomeInstructorCubit(this._apiService) : super(HomeInstructorInitial());

  // Create Course
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

  Future<void> getMyCourses() async {
    emit(HomeInstructorLoading());
    try {
      final response = await _apiService.getMyCourses();
      emit(HomeInstructorGetCoursesSuccess(response));
    } on Exception catch (e) {
      emit(
        HomeInstructorError(
          message: e.toString(),
        ),
      );
    }
  }

  Future<void> search(String query) async {
    bool isNameSearchFailed = false;
    bool isCategorySearchFailed = false;

    sr.SearchResponseBody? nameSearchResponse;
    gt.SearchCategoryResponseBody? categorySearchResponse;

    try {
      nameSearchResponse = await _apiService.searchName(query);
      debugPrint("search name");
    } catch (e) {
      isNameSearchFailed = true;
      debugPrint("search name error");
    }

    try {
      categorySearchResponse = await _apiService.searchCategory(query);
      debugPrint("category name");
    } catch (e) {
      isCategorySearchFailed = true;
      debugPrint("search category error");
    }

    if (isNameSearchFailed && isCategorySearchFailed) {
      emit(HomeInstructorError(message: "Failed to load data"));
    } else {
      List<sr.Data> allCourses = [];
      if (nameSearchResponse != null) {
        for (var element in nameSearchResponse.data ?? []) {
          allCourses.add(element);
        }
      }
      if (categorySearchResponse != null) {
        for (var element in categorySearchResponse.data ?? []) {
          allCourses.add(element);
        }
      }

      emit(SearchSuccess(allCourses));
    }
  }
}
