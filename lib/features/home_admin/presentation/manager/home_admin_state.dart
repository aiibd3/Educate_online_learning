part of 'home_admin_cubit.dart';

@immutable
sealed class HomeAdminState {}

final class HomeAdminInitial extends HomeAdminState {}

final class HomeAdminLoading extends HomeAdminState {}

final class HomeAdminError extends HomeAdminState {
  final String message;

  HomeAdminError({required this.message});
}

final class PublishedSuccessAdmin extends HomeAdminState {
  final PublishedResponseBody publishedResponseBody;

  PublishedSuccessAdmin(this.publishedResponseBody);
}

final class UnPublishedSuccessAdmin extends HomeAdminState {
  final UnPublishedResponseBody unPublishedResponseBody;

  UnPublishedSuccessAdmin(this.unPublishedResponseBody);
}

final class EditCourseSuccessAdmin extends HomeAdminState {
  final EditCourseResponseBody editCourseResponseBody;

  EditCourseSuccessAdmin(this.editCourseResponseBody);
}
