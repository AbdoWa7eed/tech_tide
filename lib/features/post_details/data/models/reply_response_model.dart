import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:tech_tide/core/data/models/user/user_response_model.dart';
import 'package:tech_tide/core/network/timestamp_converter.dart';

part 'reply_response_model.g.dart';

@JsonSerializable(createToJson: false)
class ReplyResponseModel {
  final String? replyId;
  final String? content;
  final List<String>? likes;
  final UserResponseModel? user;
  @TimestampConverter()
  final DateTime? createdAt;

  factory ReplyResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ReplyResponseModelFromJson(json);

  ReplyResponseModel(
      {required this.replyId,
      required this.content,
      required this.likes,
      required this.user,
      required this.createdAt});

  ReplyResponseModel copyWith(
      {String? replyId,
      String? content,
      List<String>? likes,
      UserResponseModel? user,
      DateTime? createdAt}) {
    return ReplyResponseModel(
      replyId: replyId ?? this.replyId,
      content: content ?? this.content,
      likes: likes ?? this.likes,
      user: user ?? this.user,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
