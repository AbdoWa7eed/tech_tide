import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:tech_tide/core/network/timestamp_converter.dart';

part 'add_post_request.g.dart';

@JsonSerializable(createFactory: false)
class AddPostRequest {
  final String title;
  final String content;
  @JsonKey(includeToJson: false)
  final List<String> tags;
  @JsonKey(includeToJson: false)
  final List<File> attachedImages;
  @TimestampConverter()
  final DateTime createdAt = DateTime.now();
  final List<String> likes = [];
  final int replies = 0;
  late String? userId;

  AddPostRequest(
      {required this.title,
      required this.content,
      required this.tags,
      required this.attachedImages,
      this.userId});

  Map<String, dynamic> toJson() => _$AppPostRequestToJson(this);

  copyWith(
      {String? title,
      String? content,
      List<String>? tags,
      List<File>? attachedImages,
      Timestamp? createdAt,
      List<String>? likes,
      String? userId}) {
    return AddPostRequest(
        title: title ?? this.title,
        content: content ?? this.content,
        tags: tags ?? this.tags,
        attachedImages: attachedImages ?? this.attachedImages,
        userId: userId ?? this.userId);
  }
}
