import 'package:tech_tide/core/data/mappers/post_mapper.dart';
import 'package:tech_tide/core/data/mappers/user_mapper.dart';
import 'package:tech_tide/core/entities/post_entity.dart';
import 'package:tech_tide/core/network/error_messages.dart';
import 'package:tech_tide/core/network/failure.dart';
import 'package:tech_tide/core/utils/extensions.dart';
import 'package:tech_tide/features/profile/data/models/profile_response_model.dart';
import 'package:tech_tide/features/profile/domain/entities/profile_entity.dart';

extension ProfileMapper on ProfileResponseModel {
  ProfileEntity toEntity() {
    if (user == null) {
      throw Failure(message: ErrorMessages.unexpectedError.translate);
    }
    return ProfileEntity(
      user: user!.toEntity(),
      posts: posts?.map((e) => e.toEntity()).toList() ?? <PostEntity>[],
      savedPosts:
          savedPosts?.map((e) => e.toEntity()).toList() ?? <PostEntity>[],
    );
  }
}
