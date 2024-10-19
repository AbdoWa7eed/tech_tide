import 'package:dartz/dartz.dart';
import 'package:tech_tide/core/network/error_handler.dart';
import 'package:tech_tide/core/utils/typedefs.dart';
import 'package:tech_tide/features/manage_post/data/data_source/manage_post_data_source.dart';
import 'package:tech_tide/features/manage_post/domain/repo/manage_post_repo.dart';

class ManagePostRepositoryImpl implements ManagePostRepository {
  final ManagePostDataSource _managePostDataSource;

  ManagePostRepositoryImpl(this._managePostDataSource);

  @override
  ResultFuture<void> toggleLikePost(String postId) async {
    try {
      return Right(await _managePostDataSource.toggleLikePost(postId));
    } catch (e) {
      return Left(ErrorHandler.handleException(e));
    }
  }

  @override
  ResultFuture<void> toggleSavePost(String postId) async {
    try {
      return Right(await _managePostDataSource.toggleSavePost(postId));
    } catch (e) {
      return Left(ErrorHandler.handleException(e));
    }
  }
}
