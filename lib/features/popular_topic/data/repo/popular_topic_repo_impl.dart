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
  ResultStream<List<PostEntity>> getTopicPosts(String topicId) {
    try {
      final responseStream =
          _popularTopicDetailsDataSource.getTopicPosts(topicId);

      final resultStream = responseStream.map((postResponses) {
        return postResponses
            .map((postResponse) => postResponse.toEntity())
            .toList();
      }).handleError((error) {
        return Left(ErrorHandler.handleException(error));
      });

      return Right(resultStream);
    } catch (e) {
      return Left(ErrorHandler.handleException(e));
    }
  }
}
