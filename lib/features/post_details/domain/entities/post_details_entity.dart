import 'package:tech_tide/core/entities/post_entity.dart';
import 'package:tech_tide/core/entities/user_entity.dart';

class PostDetailsEntity {
  final PostEntity post;
  final List<String> tags;
  final List<String> images;
  final List<ReplyEntity> replies;

  PostDetailsEntity({
    required this.post,
    required this.tags,
    required this.images,
    required this.replies,
  });
}

class ReplyEntity {
  final String? replyId;
  final String? content;
  final int? likes;
  final UserEntity? user;
  final DateTime? createdAt;

  ReplyEntity({
    required this.replyId,
    required this.content,
    required this.likes,
    required this.user,
    required this.createdAt,
  });
}
