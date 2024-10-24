import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:tech_tide/core/data/data_source/user_data_source.dart';
import 'package:tech_tide/core/data/models/user/user_response_model.dart';
import 'package:tech_tide/core/network/firebase_constants.dart';
import 'package:tech_tide/features/update_profile/data/models/update_profile_request.dart';

abstract class UpdateProfileDataSource {
  Future<UserResponseModel> updateProfile(
      UpdateProfileRequest updateProfileRequest);
}

class UpdateProfileDataSourceImpl implements UpdateProfileDataSource {
  final FirebaseFirestore _firebaseFirestore;
  final FirebaseAuth _firebaseAuth;
  final FirebaseStorage _firebaseStorage;
  final UserDataSource _userDataSource;

  UpdateProfileDataSourceImpl(this._firebaseFirestore, this._firebaseAuth,
      this._firebaseStorage, this._userDataSource);

  @override
  Future<UserResponseModel> updateProfile(
      UpdateProfileRequest updateProfileRequest) async {
    final userId = _firebaseAuth.currentUser!.uid;
    late UserResponseModel updatedUser;

    await _firebaseFirestore.runTransaction((transaction) async {
      final userRef = _firebaseFirestore
          .collection(FirebaseConstants.usersCollection)
          .doc(userId);

      final data = updateProfileRequest.toJson();

      if (updateProfileRequest.image != null) {
        final imageUrl =
            await _uploadProfileImage(updateProfileRequest.image!, userId);
        data[FirebaseConstants.imageUrlField] = imageUrl;
      }

      transaction.update(userRef, data);
    });

    updatedUser = await _userDataSource.getUser();

    return updatedUser;
  }

  Future<String> _uploadProfileImage(File imageFile, String userId) async {
    final storageRef = _firebaseStorage
        .ref()
        .child('${FirebaseConstants.profileImages}/$userId');

    final uploadTask = storageRef.putFile(imageFile);
    final taskSnapshot = await uploadTask.whenComplete(() => {});
    final downloadUrl = await taskSnapshot.ref.getDownloadURL();
    return downloadUrl;
  }
}
