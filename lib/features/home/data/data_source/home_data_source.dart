import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tech_tide/core/data/data_source/posts_data_source.dart';
import 'package:tech_tide/core/data/models/post/post_response_model.dart';
import 'package:tech_tide/core/network/firebase_constants.dart';
import 'package:tech_tide/features/home/data/models/popular_topic_model.dart';

abstract class HomeDataSource {
  Future<List<PostResponseModel>> getTrendingPosts();

  Future<List<PopularTopicResponseModel>> getPopularTopics();
}

class HomeDataSourceImpl implements HomeDataSource {
  final FirebaseFirestore _firebaseFirestore;
  final PostsDataSource _postsDataSource;

  HomeDataSourceImpl(this._firebaseFirestore, this._postsDataSource);

  @override
  Future<List<PopularTopicResponseModel>> getPopularTopics() async {
    final snapshot = await _firebaseFirestore
        .collection(FirebaseConstants.tagsCollection)
        .get();

    final topics = snapshot.docs.map((doc) {
      return PopularTopicResponseModel.fromJson(
          doc.data() as Map<String, dynamic>? ?? {});
    }).toList();

    return topics;
  }

  @override
  Future<List<PostResponseModel>> getTrendingPosts() async {
    final query = _firebaseFirestore
        .collection(FirebaseConstants.postsCollectionOrField)
        .orderBy(FirebaseConstants.likesField, descending: true)
        .limit(8);

    final posts = await _postsDataSource.getPosts(query);

    return posts;
  }
}
