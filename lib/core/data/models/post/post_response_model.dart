import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:tech_tide/core/data/models/user/user_response_model.dart';
import 'package:tech_tide/core/network/timestamp_converter.dart';

part 'post_response_model.g.dart';

@JsonSerializable(createToJson: false)
class PostResponseModel {
  final String? content;
  final String? title;
  final String? postId;
  final UserResponseModel? user;
  final List<String>? likes;
  final int? replies;
  @TimestampConverter()
  final DateTime? createdAt;

  PostResponseModel(
      {required this.content,
      required this.title,
      required this.postId,
      required this.user,
      required this.likes,
      required this.replies,
      required this.createdAt});

  factory PostResponseModel.fromJson(Map<String, dynamic> json) =>
      _$PostResponseModelFromJson(json);

  PostResponseModel copyWith(
      {String? content,
      String? title,
      String? postId,
      UserResponseModel? user,
      List<String>? likes,
      int? replies,
      DateTime? createdAt}) {
    return PostResponseModel(
      content: content ?? this.content,
      title: title ?? this.title,
      postId: postId ?? this.postId,
      user: user ?? this.user,
      likes: likes ?? this.likes,
      replies: replies ?? this.replies,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
