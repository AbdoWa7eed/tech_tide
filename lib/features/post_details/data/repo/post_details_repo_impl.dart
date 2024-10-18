import 'package:dartz/dartz.dart';
import 'package:tech_tide/core/network/error_handler.dart';
import 'package:tech_tide/core/utils/typedefs.dart';
import 'package:tech_tide/features/post_details/data/data_source/post_details_data_source.dart';
import 'package:tech_tide/features/post_details/data/mapper/mapper.dart';
import 'package:tech_tide/features/post_details/data/models/add_reply_request.dart';
import 'package:tech_tide/features/post_details/domain/entities/post_details_entity.dart';
import 'package:tech_tide/features/post_details/domain/repo/post_details_repo.dart';

class PostDetailsRepositoryImpl implements PostDetailsRepository {
  final PostDetailsDataSource _postDetailsDataSource;

  PostDetailsRepositoryImpl(this._postDetailsDataSource);

  @override
  ResultFuture<PostDetailsEntity> getPostDetails(String postId) async {
    try {
      final response = await _postDetailsDataSource.getPostDetails(postId);
      final postEntity = response.toEntity();
      return Right(postEntity);
    } catch (e) {
      return Left(ErrorHandler.handleException(e));
    }
  }

  @override
  ResultFuture<void> addReplyToPost(
      AddReplyRequest request, String postId) async {
    try {
      await _postDetailsDataSource.addReplyToPost(request, postId);
      return const Right(null);
    } catch (e) {
      return Left(ErrorHandler.handleException(e));
    }
  }
}
