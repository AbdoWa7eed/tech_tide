import 'package:tech_tide/core/utils/extensions.dart';
import 'package:tech_tide/features/auth/data/models/user_response_model.dart';
import 'package:tech_tide/features/auth/domain/entities/user_entity.dart';

extension UserMapper on UserResponseModel {
  UserEntity toEntity() {
    return UserEntity(
      userId: userId.orEmpty(),
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
