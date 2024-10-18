import 'package:dartz/dartz.dart';
import 'package:tech_tide/core/data/mappers/post_mapper.dart';
import 'package:tech_tide/core/entities/post_entity.dart';
import 'package:tech_tide/core/network/error_handler.dart';
import 'package:tech_tide/core/utils/typedefs.dart';
import 'package:tech_tide/features/popular_topic/data/data_source/popular_topic_data_source.dart';
import 'package:tech_tide/features/popular_topic/domain/repo/popular_topic_repo.dart';

class PopularTopicRepositoryImpl implements PopularTopicRepository {
  final PopularTopicDataSource _popularTopicDetailsDataSource;

  PopularTopicRepositoryImpl(this._popularTopicDetailsDataSource);

  @override
  ResultFuture<List<PostEntity>> getTopicPosts(String topicId) async {
    try {
      final response =
          await _popularTopicDetailsDataSource.getTopicPosts(topicId);
      final posts = response.map((post) => post.toEntity()).toList();
      return Right(posts);
    } catch (e) {
      return Left(ErrorHandler.handleException(e));
    }
  }
}
