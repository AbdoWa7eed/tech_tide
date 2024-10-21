import 'package:dartz/dartz.dart';
import 'package:tech_tide/core/network/error_handler.dart';
import 'package:tech_tide/core/utils/typedefs.dart';
import 'package:tech_tide/features/add_post/data/data_source/add_post_data_source.dart';
import 'package:tech_tide/features/add_post/data/models/add_post_request.dart';
import 'package:tech_tide/features/add_post/domain/repo/add_post_repo.dart';

class AddPostRepositoryImpl implements AddPostRepository {
  final AddPostDataSource _addPostDataSource;

  AddPostRepositoryImpl(this._addPostDataSource);

  @override
  ResultFuture<void> addPost(AddPostRequest request) async {
    try {
      await _addPostDataSource.addPost(request);
      return const Right(null);
    } catch (e) {
      return Left(ErrorHandler.handleException(e));
    }
  }
}
