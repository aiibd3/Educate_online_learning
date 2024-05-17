part of 'home_student_cubit.dart';

@immutable
sealed class HomeStudentState {}

final class HomeStudentInitial extends HomeStudentState {}

final class HomeStudentLoading extends HomeStudentState {}

final class HomeStudentError extends HomeStudentState {
  final String message;

  HomeStudentError({required this.message});
}

// Success
final class SearchStudentSuccess extends HomeStudentState {
  final List<sr.Data> data;

  SearchStudentSuccess(this.data);
}

final class PublishedSuccess extends HomeStudentState {
  final PublishedResponseBody publishedResponseBody;

  PublishedSuccess(this.publishedResponseBody);
}
