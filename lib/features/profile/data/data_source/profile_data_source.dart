import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';
import 'package:tech_tide/core/data/data_source/posts_data_source.dart';
import 'package:tech_tide/core/data/data_source/user_data_source.dart';
import 'package:tech_tide/core/data/models/post/post_response_model.dart';
import 'package:tech_tide/core/network/firebase_constants.dart';
import 'package:tech_tide/features/profile/data/models/profile_response_model.dart';

abstract class ProfileDataSource {
  Stream<ProfileResponseModel> getProfile();
  Stream<ProfileResponseModel> getOtherUserProfile(String userId);
  Future<void> logout();
}

class ProfileDataSourceImpl implements ProfileDataSource {
  final UserDataSource _userDataSource;
  final FirebaseFirestore _firebaseFirestore;
  final PostsDataSource _postsDataSource;
  final FirebaseAuth _firebaseAuth;

  ProfileDataSourceImpl(this._userDataSource, this._firebaseFirestore,
      this._postsDataSource, this._firebaseAuth);

  @override
  Stream<ProfileResponseModel> getProfile() async* {
    final user = await _userDataSource.getUser();

    final recentPostsIdsSnapshot = await _firebaseFirestore
        .collection(FirebaseConstants.usersCollection)
        .doc(user.userId)
        .collection(FirebaseConstants.postsKey)
        .get();

    final recentPostIdsList =
        recentPostsIdsSnapshot.docs.map((doc) => doc.id).toList();

    Stream<List<PostResponseModel>> recentPostsStream;
    if (recentPostIdsList.isNotEmpty) {
      final recentPostsQuery = _firebaseFirestore
          .collection(FirebaseConstants.postsKey)
          .where(FieldPath.documentId, whereIn: recentPostIdsList);
      recentPostsStream = _postsDataSource.getPosts(recentPostsQuery);
    } else {
      recentPostsStream = Stream.value([]);
    }

    Stream<List<PostResponseModel>> savedPostsStream;
    if (user.savedPosts != null && user.savedPosts!.isNotEmpty) {
      final savedPostsQuery = _firebaseFirestore
          .collection(FirebaseConstants.postsKey)
          .where(FieldPath.documentId, whereIn: user.savedPosts!);
      savedPostsStream = _postsDataSource.getPosts(savedPostsQuery);
    } else {
      savedPostsStream = Stream.value([]);
    }

    yield* Rx.combineLatest2(
      recentPostsStream,
      savedPostsStream,
      (List<PostResponseModel> recentPosts,
          List<PostResponseModel> savedPosts) {
        return ProfileResponseModel(
          user: user,
          posts: recentPosts,
          savedPosts: savedPosts,
        );
      },
    );
  }

  @override
  Stream<ProfileResponseModel> getOtherUserProfile(String userId) async* {
    final user = await _userDataSource.getOtherUserData(userId);
    final recentPostsIds = await _firebaseFirestore
        .collection(FirebaseConstants.usersCollection)
        .doc(user.userId)
        .collection(FirebaseConstants.postsKey)
        .get();

    final recentPostIdsList = recentPostsIds.docs.map((doc) => doc.id).toList();

    final recentPostsQuery = _firebaseFirestore
        .collection(FirebaseConstants.postsKey)
        .where(FieldPath.documentId, whereIn: recentPostIdsList);

    final recentPostsStream = _postsDataSource.getPosts(recentPostsQuery);

    await for (final posts in recentPostsStream) {
      yield ProfileResponseModel(
        user: user,
        posts: posts,
        savedPosts: [],
      );
    }
  }

  @override
  Future<void> logout() {
    return _firebaseAuth.signOut();
  }
}
