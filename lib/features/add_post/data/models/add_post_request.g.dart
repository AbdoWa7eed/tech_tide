// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_post_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$AddPostRequestToJson(AddPostRequest instance) =>
    <String, dynamic>{
      'title': instance.title,
      'content': instance.content,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
      'likes': instance.likes,
      'replies': instance.replies,
      'userId': instance.userId,
    };
