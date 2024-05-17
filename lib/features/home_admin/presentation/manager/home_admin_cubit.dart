import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../core/models/published/published_response_body.dart';
import '../../../../core/services/api/api_service.dart';
import '../../data/models/edit_course/edit_course_request_body.dart';
import '../../data/models/edit_course/edit_course_response_body.dart';
import '../../data/models/unPublished_response_body.dart';

part 'home_admin_state.dart';

@injectable
class HomeAdminCubit extends Cubit<HomeAdminState> {
  HomeAdminCubit() : super(HomeAdminInitial());
  final ApiService _apiService = ApiService();

  Future<void> publishedCourses() async {
    emit(HomeAdminLoading());
    try {
      final publishedResponse = await _apiService.publishedCourse();
      emit(PublishedSuccessAdmin(publishedResponse));
    } catch (e) {
      emit(HomeAdminError(message: "Failed to load data"));
    }
  }

  Future<void> unPublishedCourses() async {
    emit(HomeAdminLoading());
    try {
      final unPublishedResponse = await _apiService.unPublishedCourse();
      emit(UnPublishedSuccessAdmin(unPublishedResponse));
    } catch (e) {
      emit(HomeAdminError(message: "Failed to load data"));
    }
  }

  Future<void> editCourse(EditCourseRequestBody editCourseRequestBody) async {
    emit(HomeAdminLoading());
    try {
      final editCourseResponse =
          await _apiService.editCourse(editCourseRequestBody);
      emit(EditCourseSuccessAdmin(editCourseResponse));
    } catch (e) {
      emit(HomeAdminError(message: "Failed to load data"));
    }
  }
}
