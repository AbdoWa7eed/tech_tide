import 'package:tech_tide/core/utils/extensions.dart';
import 'package:tech_tide/features/home/data/models/popular_topic_model.dart';
import 'package:tech_tide/features/home/domain/entities/popular_topic_entity.dart';

extension PopularTopicMapper on PopularTopicResponseModel {
  PopularTopicEntity toEntity() {
    return PopularTopicEntity(
      name: topicName.orEmpty(),
      postsIds: postsIds ?? [],
    );
  }
}
