part of 'home_cubit.dart';

sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

final class HomeLoaded extends HomeState {
  final List<PopularTopicEntity> popularTopics;
  final List<PostEntity> trendingPosts;
  HomeLoaded(this.popularTopics, this.trendingPosts);
}

final class HomeError extends HomeState {
  final String message;
  HomeError(this.message);
}
