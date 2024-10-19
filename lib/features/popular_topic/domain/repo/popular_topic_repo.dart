import 'package:tech_tide/core/entities/post_entity.dart';
import 'package:tech_tide/core/utils/typedefs.dart';

abstract class PopularTopicRepository {
  ResultStream<List<PostEntity>> getTopicPosts(String topicId);
}
