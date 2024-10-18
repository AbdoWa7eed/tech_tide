part of 'add_post_cubit.dart';

sealed class AddPostState {}

final class AddPostInitial extends AddPostState {}

final class PostDataUpdatedState extends AddPostState {}
