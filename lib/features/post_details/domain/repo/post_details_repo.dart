import 'package:tech_tide/core/utils/typedefs.dart';
import 'package:tech_tide/features/post_details/domain/entities/post_details_entity.dart';

abstract class PostDetailsRepository {
  ResultStream<PostDetailsEntity> getPostDetails(String postId);

  ResultFuture<void> addReplyToPost(String content, String postId);

  ResultFuture<void> toggleLikeReply(String postId, String replyId);
}
