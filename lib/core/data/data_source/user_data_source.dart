import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tech_tide/core/data/models/user/user_response_model.dart';
import 'package:tech_tide/core/network/firebase_constants.dart';

abstract class UserDataSource {
  Future<UserResponseModel> getUser();
  Future<UserResponseModel> getOtherUserData(String userId);
}

class UserDataSourceImpl implements UserDataSource {
  final FirebaseFirestore _firebaseFirestore;
  final FirebaseAuth _firebaseAuth;

  UserDataSourceImpl(this._firebaseFirestore, this._firebaseAuth);

  @override
  Future<UserResponseModel> getUser() async {
    final user = await _firebaseFirestore
        .collection(FirebaseConstants.usersCollection)
        .doc(_firebaseAuth.currentUser?.uid)
        .get();

    final savedPosts = await _firebaseFirestore
        .collection(FirebaseConstants.usersCollection)
        .doc(_firebaseAuth.currentUser?.uid)
        .collection(FirebaseConstants.savedPostsCollection)
        .get();
    final userModel = UserResponseModel.fromJson(user.data() ?? {});
    return userModel.copyWith(
        savedPosts: savedPosts.docs.map((e) => e.id).toList());
  }

  @override
  Future<UserResponseModel> getOtherUserData(String userId) async {
    final user = await _firebaseFirestore
        .collection(FirebaseConstants.usersCollection)
        .doc(userId)
        .get();

    final userModel = UserResponseModel.fromJson(user.data() ?? {});
    return userModel;
  }
}
