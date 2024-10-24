import 'package:tech_tide/core/data/models/post/post_response_model.dart';
import 'package:tech_tide/core/data/models/user/user_response_model.dart';

class ProfileResponseModel {
  final UserResponseModel? user;
  final List<PostResponseModel>? posts;
  final List<PostResponseModel>? savedPosts;

  ProfileResponseModel({
    required this.user,
    required this.posts,
    required this.savedPosts,
  });
}
