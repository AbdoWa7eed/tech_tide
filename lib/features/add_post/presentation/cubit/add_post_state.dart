part of 'add_post_cubit.dart';

sealed class AddPostState {}

final class AddPostInitial extends AddPostState {}

final class PostDataUpdatedState extends AddPostState {}

final class AddPostLoading extends AddPostState {}

final class AddPostError extends AddPostState {
  final String message;
  AddPostError(this.message);
}

final class AddPostSuccess extends AddPostState {}
