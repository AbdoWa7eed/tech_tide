import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tech_tide/core/data/models/post/post_response_model.dart';
import 'package:tech_tide/core/data/models/user/user_response_model.dart';
import 'package:tech_tide/core/network/error_messages.dart';
import 'package:tech_tide/core/network/failure.dart';
import 'package:tech_tide/core/network/firebase_constants.dart';
import 'package:tech_tide/core/utils/extensions.dart';

abstract class PostsDataSource {
  Future<List<PostResponseModel>> getPosts(Query<Map<String, dynamic>> posts);
  Future<PostResponseModel> getPostById(String postId);
}

class PostsDataSourceImpl implements PostsDataSource {
  final FirebaseFirestore _firebaseFirestore;

  PostsDataSourceImpl(this._firebaseFirestore);

  @override
  Future<List<PostResponseModel>> getPosts(
      Query<Map<String, dynamic>> postsIds) async {
    final data = await postsIds.get();
    final userIds = data.docs
        .map((doc) => doc.data()[FirebaseConstants.userIdField])
        .toSet()
        .toList();

    final usersSnapshot = await _firebaseFirestore
        .collection(FirebaseConstants.usersCollection)
        .where(FirebaseConstants.userIdField, whereIn: userIds)
        .get();

    final userMap = {
      for (var userDoc in usersSnapshot.docs)
        userDoc.data()[FirebaseConstants.userIdField]:
            UserResponseModel.fromJson(userDoc.data())
    };

    final posts = data.docs.map((doc) {
      final postData = doc.data();
      final userId = postData[FirebaseConstants.userIdField] as String;

      return PostResponseModel.fromJson(postData).copyWith(
        user: userMap[userId],
      );
    }).toList();

    return posts;
  }

  @override
  Future<PostResponseModel> getPostById(String postId) async {
    final postSnapshot = await _firebaseFirestore
        .collection(FirebaseConstants.postsCollectionOrField)
        .doc(postId)
        .get();

    if (!postSnapshot.exists) {
      throw Failure(message: ErrorMessages.documentNotFound.translate);
    }

    final postData = postSnapshot.data() as Map<String, dynamic>;
    final userId = postData[FirebaseConstants.userIdField] as String;
    final userSnapshot = await _firebaseFirestore
        .collection(FirebaseConstants.usersCollection)
        .doc(userId)
        .get();

    if (!userSnapshot.exists) {
      throw Failure(message: ErrorMessages.documentNotFound.translate);
    }

    final user = UserResponseModel.fromJson(userSnapshot.data()!);

    final post = PostResponseModel.fromJson(postData).copyWith(user: user);

    return post;
  }
}
