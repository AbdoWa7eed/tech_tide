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
  @JsonKey(includeFromJson: false)
  List<String>? savedPosts;

  UserResponseModel(
      {this.savedPosts,
      required this.userId,
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

  UserResponseModel copyWith({
    String? userId,
    String? bio,
    String? email,
    String? imageUrl,
    String? username,
    bool? status,
    int? likesCount,
    int? postsCount,
    int? repliesCount,
    List<String>? savedPosts,
  }) {
    return UserResponseModel(
      userId: userId ?? this.userId,
      savedPosts: savedPosts ?? this.savedPosts,
      bio: bio ?? this.bio,
      email: email ?? this.email,
      imageUrl: imageUrl ?? this.imageUrl,
      username: username ?? this.username,
      status: status ?? this.status,
      likesCount: likesCount ?? this.likesCount,
      postsCount: postsCount ?? this.postsCount,
      repliesCount: repliesCount ?? this.repliesCount,
    );
  }
}
