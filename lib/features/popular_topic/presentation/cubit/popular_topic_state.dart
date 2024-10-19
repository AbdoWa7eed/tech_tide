part of 'popular_topic_cubit.dart';

sealed class PopularTopicState {}

final class PopularTopicInitial extends PopularTopicState {}

final class PopularTopicLoading extends PopularTopicState {}

final class PopularTopicLoaded extends PopularTopicState {
  final List<PostEntity> posts;

  PopularTopicLoaded(this.posts);
}

final class PopularTopicError extends PopularTopicState {
  final String message;
  PopularTopicError(this.message);
}
