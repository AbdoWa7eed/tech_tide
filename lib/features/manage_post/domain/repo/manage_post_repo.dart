import 'package:tech_tide/core/utils/typedefs.dart';

abstract class ManagePostRepository {
  ResultFuture<void> toggleLikePost(String postId);

  ResultFuture<void> toggleSavePost(String postId);
}
