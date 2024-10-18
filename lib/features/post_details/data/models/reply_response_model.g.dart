// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reply_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReplyResponseModel _$ReplyResponseModelFromJson(Map<String, dynamic> json) =>
    ReplyResponseModel(
      replyId: json['replyId'] as String?,
      content: json['content'] as String?,
      likes: (json['likes'] as num?)?.toInt(),
      user: json['user'] == null
          ? null
          : UserResponseModel.fromJson(json['user'] as Map<String, dynamic>),
      createdAt: _$JsonConverterFromJson<Timestamp, DateTime>(
          json['createdAt'], const TimestampConverter().fromJson),
    );

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);
