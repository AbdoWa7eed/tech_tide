// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'popular_topic_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PopularTopicResponseModel _$PopularTopicResponseModelFromJson(
        Map<String, dynamic> json) =>
    PopularTopicResponseModel(
      topicName: json['tag'] as String?,
      postsIds:
          (json['posts'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );
