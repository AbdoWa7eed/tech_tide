import 'package:tech_tide/core/data/mappers/post_mapper.dart';
import 'package:tech_tide/core/data/mappers/user_mapper.dart';
import 'package:tech_tide/core/network/error_messages.dart';
import 'package:tech_tide/core/network/failure.dart';
import 'package:tech_tide/core/utils/extensions.dart';
import 'package:tech_tide/features/post_details/data/models/post_details_model.dart';
import 'package:tech_tide/features/post_details/data/models/reply_response_model.dart';
import 'package:tech_tide/features/post_details/domain/entities/post_details_entity.dart';

extension PostDetailsMapper on PostDetailsResponseModel {
  PostDetailsEntity toEntity() {
    if (post == null) {
      throw Failure(message: ErrorMessages.unexpectedError.translate);
    }
    return PostDetailsEntity(
      post: post!.toEntity(),
      tags: tags ?? [],
      images: images ?? [],
      replies: repliesModels?.map((reply) => reply.toEntity()).toList() ?? [],
    );
  }
}

extension ReplyMapper on ReplyResponseModel {
  ReplyEntity toEntity() {
    if (user == null) {
      throw Failure(message: ErrorMessages.unexpectedError.translate);
    }
    return ReplyEntity(
      replyId: replyId,
      content: content,
      likes: likes,
      user: user!.toEntity(),
      createdAt: createdAt,
    );
  }
}
