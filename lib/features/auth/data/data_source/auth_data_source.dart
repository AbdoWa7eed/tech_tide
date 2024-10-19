import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tech_tide/core/data/models/user/user_response_model.dart';
import 'package:tech_tide/core/network/error_messages.dart';
import 'package:tech_tide/core/network/failure.dart';
import 'package:tech_tide/core/network/firebase_constants.dart';
import 'package:tech_tide/core/utils/extensions.dart';
import 'package:tech_tide/features/auth/data/models/user_login_request.dart';
import 'package:tech_tide/features/auth/data/models/user_register_request.dart';

abstract class AuthDataSource {
  Future<UserResponseModel> login(UserLoginRequest request);

  Future<UserResponseModel> register(UserRegisterRequest request);
}

class AuthDataSourceImpl implements AuthDataSource {
  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firebaseFirestore;

  AuthDataSourceImpl(this._firebaseAuth, this._firebaseFirestore);

  @override
  Future<UserResponseModel> login(UserLoginRequest request) async {
    final userCredentials = await _firebaseAuth.signInWithEmailAndPassword(
      email: request.email,
      password: request.password,
    );

    final user = await _firebaseFirestore
        .collection(FirebaseConstants.usersCollection)
        .doc(userCredentials.user?.uid)
        .get();

    if (!user.exists) {
      throw Failure(message: ErrorMessages.userNotFound.translate);
    }
    final savedPosts = await _firebaseFirestore
        .collection(FirebaseConstants.usersCollection)
        .doc(userCredentials.user?.uid)
        .collection(FirebaseConstants.savedPostsCollection)
        .get();
    final userModel = UserResponseModel.fromJson(user.data() ?? {});

    return userModel.copyWith(
        savedPosts: savedPosts.docs.map((e) => e.id).toList());
  }

  @override
  Future<UserResponseModel> register(UserRegisterRequest request) async {
    final userCredentials = await _firebaseAuth.createUserWithEmailAndPassword(
      email: request.email,
      password: request.password,
    );

    final userId = userCredentials.user?.uid;
    final doc = _firebaseFirestore
        .collection(FirebaseConstants.usersCollection)
        .doc(userId);
    final userData = {
      ...request.toJson(),
      FirebaseConstants.userIdField: userId,
    };
    await doc.set(userData);
    final user = await doc.get();

    return UserResponseModel.fromJson(user.data() ?? {});
  }
}
