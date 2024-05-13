part of 'home_instructor_cubit.dart';

@immutable
sealed class HomeInstructorState {}

final class HomeInstructorInitial extends HomeInstructorState {}

final class HomeInstructorLoading extends HomeInstructorState {}

final class HomeInstructorSuccess extends HomeInstructorState {
  final CreateCourseResponseBody createCourseResponseBody;

  HomeInstructorSuccess(this.createCourseResponseBody);
}

final class HomeInstructorError extends HomeInstructorState {
  final String message;

  HomeInstructorError({required this.message});
}

final class HomeInstructorSearchSuccess extends HomeInstructorState {
  final SearchResponseBody searchResponseBody;

  HomeInstructorSearchSuccess(this.searchResponseBody);
}

