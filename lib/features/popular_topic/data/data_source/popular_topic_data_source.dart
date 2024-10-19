import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tech_tide/core/data/data_source/posts_data_source.dart';
import 'package:tech_tide/core/data/models/post/post_response_model.dart';
import 'package:tech_tide/core/network/firebase_constants.dart';

abstract class PopularTopicDataSource {
  Stream<List<PostResponseModel>> getTopicPosts(String topicId);
}

class PopularTopicDataSourceImpl implements PopularTopicDataSource {
  final FirebaseFirestore _firebaseFirestore;
  final PostsDataSource _postsDataSource;

  PopularTopicDataSourceImpl(this._firebaseFirestore, this._postsDataSource);

  @override
  Stream<List<PostResponseModel>> getTopicPosts(String topicId) {
    return _firebaseFirestore
        .collection(FirebaseConstants.tagsCollection)
        .doc(topicId)
        .snapshots()
        .asyncExpand((topicSnapshot) {
      final topicData = topicSnapshot.data();
      if (topicData == null) {
        return Stream.value([]);
      }

      final postIds = topicData[FirebaseConstants.postsKey] as List<dynamic>?;
      if (postIds == null || postIds.isEmpty) {
        return Stream.value([]);
      }

      final query = _firebaseFirestore
          .collection(FirebaseConstants.postsKey)
          .where(FirebaseConstants.postIdField, whereIn: postIds);

      final postsStream = _postsDataSource.getPosts(query);

      return postsStream;
    });
  }
}
