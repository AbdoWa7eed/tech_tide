import 'package:tech_tide/core/entities/post_entity.dart';
import 'package:tech_tide/core/utils/typedefs.dart';
import 'package:tech_tide/features/home/domain/entities/popular_topic_entity.dart';

abstract class HomeRepository {
  ResultFuture<List<PostEntity>> getTrendingPosts();
  ResultFuture<List<PopularTopicEntity>> getPopularTopics();
}
