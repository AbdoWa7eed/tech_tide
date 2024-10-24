import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tech_tide/core/network/error_messages.dart';
import 'package:tech_tide/core/network/failure.dart';
import 'package:tech_tide/core/network/firebase_constants.dart';
import 'package:tech_tide/core/utils/extensions.dart';

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

    final postRef =
        _firebaseFirestore.collection(FirebaseConstants.postsKey).doc(postId);

    await _firebaseFirestore.runTransaction((transaction) async {
      final postSnapshot = await transaction.get(postRef);

      if (!postSnapshot.exists) {
        throw Failure(message: ErrorMessages.documentNotFound.translate);
      }

      final likes =
          postSnapshot.get(FirebaseConstants.likesKey) as List<dynamic>? ?? [];
      final postOwnerId =
          postSnapshot.get(FirebaseConstants.userIdField) as String;

      if (likes.contains(userId)) {
        transaction.update(postRef, {
          FirebaseConstants.likesKey: FieldValue.arrayRemove([userId]),
        });
        transaction.update(
            _firebaseFirestore
                .collection(FirebaseConstants.usersCollection)
                .doc(postOwnerId),
            {
              FirebaseConstants.likesCountField: FieldValue.increment(-1),
            });
      } else {
        transaction.update(postRef, {
          FirebaseConstants.likesKey: FieldValue.arrayUnion([userId]),
        });
        transaction.update(
            _firebaseFirestore
                .collection(FirebaseConstants.usersCollection)
                .doc(postOwnerId),
            {
              FirebaseConstants.likesCountField: FieldValue.increment(1),
            });
      }
    });
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
