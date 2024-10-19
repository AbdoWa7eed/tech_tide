part of 'manage_post_cubit.dart';

sealed class ManagePostState {}

final class ManagePostInitial extends ManagePostState {}

final class ManagePostSuccess extends ManagePostState {}

final class ManagePostError extends ManagePostState {
  final String message;
  ManagePostError(this.message);
}
