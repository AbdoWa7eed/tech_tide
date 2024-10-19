import 'package:tech_tide/core/data/models/user/user_response_model.dart';
import 'package:tech_tide/core/entities/user_entity.dart';
import 'package:tech_tide/core/utils/extensions.dart';

extension UserMapper on UserResponseModel {
  UserEntity toEntity() {
    return UserEntity(
      userId: userId.orEmpty(),
      savedPosts: savedPosts ?? [],
      bio: bio.orEmpty(),
      email: email.orEmpty(),
      imageUrl: imageUrl.orEmpty(),
      username: username.orEmpty(),
      status: status ?? false,
      likesCount: likesCount.orZero().toInt(),
      postsCount: postsCount.orZero().toInt(),
      repliesCount: repliesCount.orZero().toInt(),
    );
  }
}
