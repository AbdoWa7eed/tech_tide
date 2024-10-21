import 'package:tech_tide/core/utils/typedefs.dart';
import 'package:tech_tide/features/add_post/data/models/add_post_request.dart';

abstract class AddPostRepository {
  ResultFuture<void> addPost(AddPostRequest request);
}
