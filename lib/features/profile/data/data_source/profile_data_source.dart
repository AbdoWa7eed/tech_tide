import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rxdart/rxdart.dart';
import 'package:tech_tide/core/data/data_source/posts_data_source.dart';
import 'package:tech_tide/core/data/data_source/user_data_source.dart';
import 'package:tech_tide/core/data/models/post/post_response_model.dart';
import 'package:tech_tide/core/network/firebase_constants.dart';
import 'package:tech_tide/features/profile/data/models/profile_response_model.dart';

abstract class ProfileDataSource {
  Stream<ProfileResponseModel> getProfile();
}

class ProfileDataSourceImpl implements ProfileDataSource {
  final UserDataSource _userDataSource;
  final FirebaseFirestore _firebaseFirestore;
  final PostsDataSource _postsDataSource;

  ProfileDataSourceImpl(
      this._userDataSource, this._firebaseFirestore, this._postsDataSource);

  @override
  Stream<ProfileResponseModel> getProfile() async* {
    final user = await _userDataSource.getUser();

    final recentPostsIds = await _firebaseFirestore
        .collection(FirebaseConstants.usersCollection)
        .doc(user.userId)
        .collection(FirebaseConstants.postsKey)
        .get();

    final recentPostIdsList = recentPostsIds.docs.map((doc) => doc.id).toList();

    final recentPostsQuery = _firebaseFirestore
        .collection(FirebaseConstants.postsKey)
        .where(FieldPath.documentId, whereIn: recentPostIdsList);

    final savedPostsQuery = _firebaseFirestore
        .collection(FirebaseConstants.postsKey)
        .where(FieldPath.documentId, whereIn: user.savedPosts ?? <String>[]);

    final recentPostsStream = _postsDataSource.getPosts(recentPostsQuery);
    final savedPostsStream = _postsDataSource.getPosts(savedPostsQuery);

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
}
