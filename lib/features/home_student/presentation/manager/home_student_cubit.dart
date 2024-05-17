import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

// import 'package:meta/meta.dart';
import '../../../../core/models/published/published_response_body.dart';
import '../../../../core/services/api/api_service.dart';

import '../../../../../core/models/searchCategory/search_category_response_body.dart'
    as gt;
import '../../../../../core/models/searchName/search_response_body.dart' as sr;

part 'home_student_state.dart';

@injectable
class HomeStudentCubit extends Cubit<HomeStudentState> {
  HomeStudentCubit() : super(HomeStudentInitial());

  final ApiService _apiService = ApiService();

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
      emit(HomeStudentError(message: "Failed to load data"));
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

      emit(SearchStudentSuccess(allCourses));
    }
  }

  Future<void> publishedCourses() async {
    emit(HomeStudentLoading());
    try {
      final publishedResponse = await _apiService.publishedCourse();
      emit(PublishedSuccess(publishedResponse));
    } catch (e) {
      emit(HomeStudentError(message: "Failed to load data"));
    }
  }
}
