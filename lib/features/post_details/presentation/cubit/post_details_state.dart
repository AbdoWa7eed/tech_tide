part of 'post_details_cubit.dart';

sealed class PostDetailsState {}

final class PostDetailsInitial extends PostDetailsState {}

final class PostDetailsLoading extends PostDetailsState {}

final class PostDetailsLoaded extends PostDetailsState {}

final class PostDetailsError extends PostDetailsState {
  final String message;
  PostDetailsError(this.message);
}

final class AddReplyLoading extends PostDetailsState {}

final class AddReplySuccess extends PostDetailsState {}

final class AddReplyError extends PostDetailsState {
  final String message;
  AddReplyError(this.message);
}

final class ToggleLikeReplyLoading extends PostDetailsState {}

final class ToggleLikeReplySuccess extends PostDetailsState {}

final class ToggleLikeReplyError extends PostDetailsState {
  final String message;
  ToggleLikeReplyError(this.message);
}
