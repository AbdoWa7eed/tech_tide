import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:tech_tide/core/network/firebase_constants.dart';
import 'package:tech_tide/features/add_post/data/models/add_post_request.dart';

abstract class AddPostDataSource {
  Future<void> addPost(AddPostRequest appPostRequest);
}

class AddPostDataSourceImpl implements AddPostDataSource {
  final FirebaseFirestore _firebaseFirestore;
  final FirebaseAuth _firebaseAuth;
  final FirebaseStorage _firebaseStorage;

  AddPostDataSourceImpl(
      this._firebaseFirestore, this._firebaseAuth, this._firebaseStorage);

  @override
  Future<void> addPost(AddPostRequest appPostRequest) async {
    final userId = _firebaseAuth.currentUser?.uid;
    appPostRequest = appPostRequest.copyWith(userId: userId);
    await _firebaseFirestore.runTransaction((transaction) async {
      final postRef =
          _firebaseFirestore.collection(FirebaseConstants.postsKey).doc();
      final postId = postRef.id;

      transaction.set(postRef,
          {...appPostRequest.toJson(), FirebaseConstants.postIdField: postId});
      if (appPostRequest.attachedImages.isNotEmpty) {
        await _uploadImages(
            appPostRequest.attachedImages, postRef, transaction);
      }
      if (appPostRequest.tags.isNotEmpty) {
        await _handleTags(appPostRequest.tags, postId, postRef, transaction);
      }
    });
  }

  Future<void> _uploadImages(List<File> attachedImages,
      DocumentReference postRef, Transaction transaction) async {
    final imagesCollection =
        postRef.collection(FirebaseConstants.imagesCollection);

    for (final imageFile in attachedImages) {
      final fileName = DateTime.now().millisecondsSinceEpoch.toString();
      final storageRef = _firebaseStorage
          .ref()
          .child('${FirebaseConstants.imagesCollection}/$fileName');

      final uploadTask = storageRef.putFile(imageFile);
      final taskSnapshot = await uploadTask.whenComplete(() => {});
      final downloadUrl = await taskSnapshot.ref.getDownloadURL();
      transaction.set(imagesCollection.doc(),
          {FirebaseConstants.imageUrlField: downloadUrl});
    }
  }

  Future<void> _handleTags(List<String> tags, String postId,
      DocumentReference postRef, Transaction transaction) async {
    final tagsCollection =
        _firebaseFirestore.collection(FirebaseConstants.tagsCollection);
    final postTagsSubCollection =
        postRef.collection(FirebaseConstants.tagsCollection);

    for (final tag in tags) {
      transaction.set(
          postTagsSubCollection.doc(tag), {FirebaseConstants.tagField: tag});

      final tagDocRef = tagsCollection.doc(tag);
      final tagDocSnapshot = await tagDocRef.get();

      if (tagDocSnapshot.exists) {
        transaction.set(
            tagDocRef,
            {
              FirebaseConstants.postsKey: FieldValue.arrayUnion([postId])
            },
            SetOptions(merge: true));
      } else {
        transaction.set(tagDocRef, {
          FirebaseConstants.tagField: tag,
          FirebaseConstants.postsKey: [postId]
        });
      }
    }
  }
}
