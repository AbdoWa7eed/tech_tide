import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tech_tide/core/data/models/post/post_response_model.dart';
import 'package:tech_tide/core/network/firebase_constants.dart';
import 'package:tech_tide/features/home/data/models/popular_topic_model.dart';

abstract class HomeDataSource {
  Future<List<PostResponseModel>> getTrendingPosts();

  Future<List<PopularTopicResponseModel>> getPopularTopics();
}

class HomeDataSourceImpl implements HomeDataSource {
  final FirebaseFirestore _firebaseFirestore;

  HomeDataSourceImpl(this._firebaseFirestore);

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
    final snapshot = await _firebaseFirestore
        .collection(FirebaseConstants.postsCollection)
        .orderBy(FirebaseConstants.likesField, descending: true)
        .limit(8)
        .get();

    final posts = snapshot.docs.map((doc) {
      return PostResponseModel.fromJson(doc.data());
    }).toList();

    return posts;
  }
}
