part of 'home_instructor_cubit.dart';

@immutable
sealed class HomeInstructorState {}

final class HomeInstructorInitial extends HomeInstructorState {}

final class HomeInstructorLoading extends HomeInstructorState {}

final class HomeInstructorError extends HomeInstructorState {
  final String message;

  HomeInstructorError({required this.message});
}

// Success

// Create Course
final class HomeInstructorSuccess extends HomeInstructorState {
  final CreateCourseResponseBody createCourseResponseBody;

  HomeInstructorSuccess(this.createCourseResponseBody);
}

// Search Name
final class HomeInstructorSearchSuccess extends HomeInstructorState {
  final sr.SearchResponseBody searchResponseBody;

  HomeInstructorSearchSuccess(this.searchResponseBody);
}

// Search Category
final class HomeInstructorSearchCategorySuccess extends HomeInstructorState {
  final gt.SearchCategoryResponseBody searchCategoryResponseBody;

  HomeInstructorSearchCategorySuccess(this.searchCategoryResponseBody);
}

// Get Courses
final class HomeInstructorGetCoursesSuccess extends HomeInstructorState {
  final GetCoursesResponseBody getCoursesResponseBody;

  HomeInstructorGetCoursesSuccess(this.getCoursesResponseBody);
}

final class SearchSuccess extends HomeInstructorState {
  final List<sr.Data> data;

  SearchSuccess(this.data);
}
