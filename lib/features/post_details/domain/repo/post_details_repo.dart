import 'package:tech_tide/core/utils/typedefs.dart';
import 'package:tech_tide/features/post_details/data/models/add_reply_request.dart';
import 'package:tech_tide/features/post_details/domain/entities/post_details_entity.dart';

abstract class PostDetailsRepository {
  ResultFuture<PostDetailsEntity> getPostDetails(String postId);

  ResultFuture<void> addReplyToPost(AddReplyRequest request, String postId);
}
