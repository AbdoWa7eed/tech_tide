import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tech_tide/core/network/firebase_constants.dart';

abstract class ManagePostDataSource {
  Future<void> toggleLikePost(String postId);

  Future<void> toggleSavePost(String postId);
}

class ManagePostDataSourceImpl implements ManagePostDataSource {
  final FirebaseFirestore _firebaseFirestore;
  final FirebaseAuth _firebaseAuth;

  ManagePostDataSourceImpl(this._firebaseFirestore, this._firebaseAuth);

  @override
  Future<void> toggleLikePost(String postId) async {
    final userId = _firebaseAuth.currentUser?.uid;

    if (userId == null) {
      throw Exception("User must be authenticated to like a post.");
    }

    final postRef =
        _firebaseFirestore.collection(FirebaseConstants.postsKey).doc(postId);

    final postSnapshot = await postRef.get();
    if (!postSnapshot.exists) {
      throw Exception("Post not found.");
    }

    final likes =
        postSnapshot.get(FirebaseConstants.likesKey) as List<dynamic>? ?? [];
    if (likes.contains(userId)) {
      await postRef.update({
        FirebaseConstants.likesKey: FieldValue.arrayRemove([userId]),
      });
    } else {
      likes.add(userId);
      await postRef
          .set({FirebaseConstants.likesKey: likes}, SetOptions(merge: true));
    }
  }

  @override
  Future<void> toggleSavePost(String postId) async {
    String? userId = _firebaseAuth.currentUser?.uid;
    final savedPostRef = _firebaseFirestore
        .collection(FirebaseConstants.usersCollection)
        .doc(userId)
        .collection(FirebaseConstants.savedPostsCollection)
        .doc(postId);
    final savedPostSnapshot = await savedPostRef.get();

    if (savedPostSnapshot.exists) {
      await savedPostRef.delete();
    } else {
      await savedPostRef.set({});
    }
  }
}
