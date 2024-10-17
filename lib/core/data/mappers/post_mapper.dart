import 'package:tech_tide/core/data/mappers/user_mapper.dart'; // Import the UserMapper extension
import 'package:tech_tide/core/data/models/post/post_response_model.dart';
import 'package:tech_tide/core/entities/post_entity.dart';
import 'package:tech_tide/core/network/error_messages.dart';
import 'package:tech_tide/core/network/failure.dart';
import 'package:tech_tide/core/utils/extensions.dart';

extension PostMapper on PostResponseModel {
  PostEntity toEntity() {
    if (user == null) {
      throw Failure(message: ErrorMessages.unexpectedError.translate);
    }
    return PostEntity(
      id: postId.orEmpty(),
      title: title.orEmpty(),
      content: content.orEmpty(),
      user: user!.toEntity(),
      likes: likes.orZero().toInt(),
      replies: replies.orZero().toInt(),
      views: views.orZero().toInt(),
      createdAt: createdAt ?? DateTime.now(),
    );
  }
}
