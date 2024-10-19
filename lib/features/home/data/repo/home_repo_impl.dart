import 'package:dartz/dartz.dart';
import 'package:tech_tide/core/data/mappers/post_mapper.dart';
import 'package:tech_tide/core/entities/post_entity.dart';
import 'package:tech_tide/core/network/error_handler.dart';
import 'package:tech_tide/core/utils/typedefs.dart';
import 'package:tech_tide/features/home/data/data_source/home_data_source.dart';
import 'package:tech_tide/features/home/data/mapper/mapper.dart';
import 'package:tech_tide/features/home/domain/entities/popular_topic_entity.dart';
import 'package:tech_tide/features/home/domain/repo/home_repo.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeDataSource _homeDataSource;

  HomeRepositoryImpl(this._homeDataSource);

  @override
  ResultStream<List<PostEntity>> getTrendingPosts() {
    try {
      final result = _homeDataSource.getTrendingPosts().map((posts) {
        final postEntities = posts.map((post) => post.toEntity()).toList();
        return postEntities;
      }).handleError((error) {
        return Left(ErrorHandler.handleException(error));
      });
      return Right(result);
    } catch (e) {
      return Left(ErrorHandler.handleException(e));
    }
  }

  @override
  ResultFuture<List<PopularTopicEntity>> getPopularTopics() async {
    try {
      final response = await _homeDataSource.getPopularTopics();
      final topics = response.map((topic) => topic.toEntity()).toList();
      return Right(topics);
    } catch (e) {
      return Left(ErrorHandler.handleException(e));
    }
  }
}
