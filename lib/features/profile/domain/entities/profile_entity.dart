import 'package:tech_tide/core/entities/post_entity.dart';
import 'package:tech_tide/core/entities/user_entity.dart';

class ProfileEntity {
  final UserEntity user;
  final List<PostEntity> posts;
  final List<PostEntity> savedPosts;

  ProfileEntity(
      {required this.user, required this.posts, required this.savedPosts});
}
