import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tech_tide/core/data/data_source/posts_data_source.dart';
import 'package:tech_tide/core/data/models/post/post_response_model.dart';
import 'package:tech_tide/core/network/firebase_constants.dart';

abstract class PopularTopicDataSource {
  Future<List<PostResponseModel>> getTopicPosts(String topicId);
}

class PopularTopicDataSourceImpl implements PopularTopicDataSource {
  final FirebaseFirestore _firebaseFirestore;
  final PostsDataSource _postsDataSource;

  PopularTopicDataSourceImpl(this._firebaseFirestore, this._postsDataSource);

  @override
  Future<List<PostResponseModel>> getTopicPosts(String topicId) async {
    final topic = await _firebaseFirestore
        .collection(FirebaseConstants.tagsCollection)
        .doc(topicId)
        .get();
    final query = _firebaseFirestore
        .collection(FirebaseConstants.postsCollectionOrField)
        .where(FirebaseConstants.postIdField,
            arrayContains:
                topic.data()?[FirebaseConstants.postsCollectionOrField]);
    final posts = await _postsDataSource.getPosts(query);
    return posts;
  }
}
