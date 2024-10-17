import 'package:json_annotation/json_annotation.dart';

part 'user_response_model.g.dart';

@JsonSerializable(createToJson: false)
class UserResponseModel {
  final String? userId;
  final String? email;
  final String? imageUrl;
  final String? bio;
  final String? username;
  final bool? status;
  final int? likesCount;
  final int? postsCount;
  final int? repliesCount;

  UserResponseModel(
      {required this.userId,
      required this.bio,
      required this.email,
      required this.imageUrl,
      required this.username,
      required this.status,
      required this.likesCount,
      required this.postsCount,
      required this.repliesCount});

  factory UserResponseModel.fromJson(Map<String, dynamic> json) =>
      _$UserResponseModelFromJson(json);
}
