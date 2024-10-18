import 'package:tech_tide/core/data/models/post/post_response_model.dart';
import 'package:tech_tide/features/post_details/data/models/reply_response_model.dart';

class PostDetailsResponseModel {
  final PostResponseModel? post;
  final List<String>? tags;
  final List<String>? images;
  final List<ReplyResponseModel>? repliesModels;

  PostDetailsResponseModel(
      {required this.post,
      required this.tags,
      required this.images,
      required this.repliesModels});
}
