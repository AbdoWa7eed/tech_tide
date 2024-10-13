// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserResponseModel _$UserResponseModelFromJson(Map<String, dynamic> json) =>
    UserResponseModel(
      userId: json['userId'] as String?,
      bio: json['bio'] as String?,
      email: json['email'] as String?,
      imageUrl: json['imageUrl'] as String?,
      username: json['username'] as String?,
      status: json['status'] as bool?,
      likesCount: (json['likesCount'] as num?)?.toInt(),
      postsCount: (json['postsCount'] as num?)?.toInt(),
      repliesCount: (json['repliesCount'] as num?)?.toInt(),
    );
