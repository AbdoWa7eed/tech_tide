import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tech_tide/core/data/data_source/posts_data_source.dart';
import 'package:tech_tide/core/network/firebase_constants.dart';
import 'package:tech_tide/features/post_details/data/models/add_reply_request.dart';
import 'package:tech_tide/features/post_details/data/models/post_details_model.dart';
import 'package:tech_tide/features/post_details/data/models/reply_response_model.dart';

abstract class PostDetailsDataSource {
  Future<PostDetailsResponseModel> getPostDetails(String postId);

  Future<void> addReplyToPost(AddReplyRequest request, String postId);
}

class PostDetailsDataSourceImpl implements PostDetailsDataSource {
  final PostsDataSource _postsDataSource;
  final FirebaseFirestore _firebaseFirestore;

  PostDetailsDataSourceImpl({
    required PostsDataSource postsDataSource,
    required FirebaseFirestore firebaseFirestore,
  })  : _postsDataSource = postsDataSource,
        _firebaseFirestore = firebaseFirestore;

  @override
  Future<PostDetailsResponseModel> getPostDetails(String postId) async {
    final post = await _postsDataSource.getPostById(postId);

    final repliesCollection = _firebaseFirestore
        .collection(FirebaseConstants.postsCollectionOrField)
        .doc(postId)
        .collection(FirebaseConstants.repliesCollection)
        .get();

    final tagsCollection = _firebaseFirestore
        .collection(FirebaseConstants.postsCollectionOrField)
        .doc(postId)
        .collection(FirebaseConstants.tagsCollection)
        .get();

    final imagesCollection = _firebaseFirestore
        .collection(FirebaseConstants.postsCollectionOrField)
        .doc(postId)
        .collection(FirebaseConstants.imagesCollection)
        .get();

    final queryResults = await Future.wait([
      repliesCollection,
      tagsCollection,
      imagesCollection,
    ]);

    return PostDetailsResponseModel(
      post: post,
      repliesModels: queryResults[0]
          .docs
          .map((doc) => ReplyResponseModel.fromJson(doc.data()))
          .toList(),
      tags: queryResults[1].docs.map((doc) => doc.id).toList(),
      images: queryResults[2].docs.map((doc) => doc.id).toList(),
    );
  }

  @override
  Future<void> addReplyToPost(AddReplyRequest request, String postId) async {
    final replies = _firebaseFirestore
        .collection(FirebaseConstants.postsCollectionOrField)
        .doc(postId)
        .collection(FirebaseConstants.repliesCollection);
    final replyRef = replies.doc();
    await replyRef.set({
      ...request.toJson(),
      FirebaseConstants.replyIdField: replyRef.id,
    });
  }
}
