import 'package:json_annotation/json_annotation.dart';

part 'popular_topic_model.g.dart';

@JsonSerializable(createToJson: false)
class PopularTopicResponseModel {
  @JsonKey(name: "tag")
  final String? topicName;
  @JsonKey(name: "posts")
  final List<String>? postsIds;

  PopularTopicResponseModel({required this.topicName, required this.postsIds});

  factory PopularTopicResponseModel.fromJson(Map<String, dynamic> json) =>
      _$PopularTopicResponseModelFromJson(json);
}
