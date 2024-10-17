import 'package:tech_tide/core/entities/user_entity.dart';

class PostEntity {
  final String id;
  final String title;
  final String content;
  final UserEntity user;
  final int likes;
  final int replies;
  final int views;
  final DateTime createdAt;

  PostEntity({
    required this.id,
    required this.title,
    required this.content,
    required this.user,
    required this.likes,
    required this.replies,
    required this.views,
    required this.createdAt,
  });
}
