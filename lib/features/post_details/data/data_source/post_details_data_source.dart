import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tech_tide/core/data/data_source/posts_data_source.dart';
import 'package:tech_tide/core/data/models/user/user_response_model.dart';
import 'package:tech_tide/core/network/error_messages.dart';
import 'package:tech_tide/core/network/failure.dart';
import 'package:tech_tide/core/network/firebase_constants.dart';
import 'package:tech_tide/core/utils/extensions.dart';
import 'package:tech_tide/features/post_details/data/models/add_reply_request.dart';
import 'package:tech_tide/features/post_details/data/models/post_details_model.dart';
import 'package:tech_tide/features/post_details/data/models/reply_response_model.dart';

abstract class PostDetailsDataSource {
  Stream<PostDetailsResponseModel> getPostDetails(String postId);

  Future<void> addReplyToPost(AddReplyRequest request, String postId);

  Future<void> toggleLikeReply(String postId, String replyId);
}

class PostDetailsDataSourceImpl implements PostDetailsDataSource {
  final PostsDataSource _postsDataSource;
  final FirebaseFirestore _firebaseFirestore;
  final FirebaseAuth _firebaseAuth;

  PostDetailsDataSourceImpl(
      this._firebaseAuth, this._postsDataSource, this._firebaseFirestore);

  @override
  Stream<PostDetailsResponseModel> getPostDetails(String postId) async* {
    final post = await _postsDataSource.getPostById(postId);

    final tagsCollection = await _firebaseFirestore
        .collection(FirebaseConstants.postsKey)
        .doc(postId)
        .collection(FirebaseConstants.tagsCollection)
        .get();

    final imagesCollection = await _firebaseFirestore
        .collection(FirebaseConstants.postsKey)
        .doc(postId)
        .collection(FirebaseConstants.imagesCollection)
        .get();

    final tags = tagsCollection.docs.map((doc) => doc.id).toList();
    final images = imagesCollection.docs
        .map((doc) => doc.data()[FirebaseConstants.imageUrlField] as String?)
        .where((imageUrl) => imageUrl != null)
        .cast<String>()
        .toList();

    final repliesStream = _firebaseFirestore
        .collection(FirebaseConstants.postsKey)
        .doc(postId)
        .collection(FirebaseConstants.repliesKey)
        .orderBy(FirebaseConstants.createdAtField, descending: true)
        .snapshots();

    await for (final repliesSnapshot in repliesStream) {
      final replies = await Future.wait(repliesSnapshot.docs.map((doc) async {
        final reply = ReplyResponseModel.fromJson(doc.data());
        final user =
            await _getRepliedUser(doc.data()[FirebaseConstants.userIdField]);
        return reply.copyWith(user: user);
      }).toList());

      yield PostDetailsResponseModel(
        post: post,
        repliesModels: replies,
        tags: tags,
        images: images,
      );
    }
  }

  Future<UserResponseModel> _getRepliedUser(String userId) async {
    final user = await _firebaseFirestore
        .collection(FirebaseConstants.usersCollection)
        .doc(userId)
        .get();
    return UserResponseModel.fromJson(user.data() ?? {});
  }

  @override
  Future<void> addReplyToPost(AddReplyRequest request, String postId) async {
    final userId = _firebaseAuth.currentUser?.uid; // Retrieve the user ID
    if (userId == null) return; // Ensure user is authenticated

    final requestWithUser = request.copyWith(userId: userId);
    final postRef =
        _firebaseFirestore.collection(FirebaseConstants.postsKey).doc(postId);
    final repliesRef = postRef.collection(FirebaseConstants.repliesKey);
    final replyRef = repliesRef.doc();

    await _firebaseFirestore.runTransaction((transaction) async {
      final postDoc = await transaction.get(postRef);

      if (!postDoc.exists) {
        throw Failure(message: ErrorMessages.documentNotFound.translate);
      }

      transaction.set(replyRef, {
        ...requestWithUser.toJson(),
        FirebaseConstants.replyIdField: replyRef.id,
        FirebaseConstants.createdAtField: FieldValue.serverTimestamp(),
      });

      transaction.update(
          postRef, {FirebaseConstants.repliesKey: FieldValue.increment(1)});

      final userRef = _firebaseFirestore
          .collection(FirebaseConstants.usersCollection)
          .doc(userId);
      transaction.update(userRef, {
        FirebaseConstants.repliesCountField: FieldValue.increment(1),
      });
    });
  }

  @override
  Future<void> toggleLikeReply(String postId, String replyId) async {
    final replyRef = _firebaseFirestore
        .collection(FirebaseConstants.postsKey)
        .doc(postId)
        .collection(FirebaseConstants.repliesKey)
        .doc(replyId);

    return _firebaseFirestore.runTransaction((transaction) async {
      final replySnapshot = await transaction.get(replyRef);

      if (!replySnapshot.exists) {
        throw Failure(message: ErrorMessages.documentNotFound.translate);
      }

      final likes = List<String>.from(
          replySnapshot.data()?[FirebaseConstants.likesKey] ?? []);

      if (likes.contains(userId)) {
        likes.remove(userId);
      } else {
        likes.add(userId);
      }

      transaction.update(replyRef, {FirebaseConstants.likesKey: likes});
    });
  }

  String get userId => _firebaseAuth.currentUser!.uid;
}
