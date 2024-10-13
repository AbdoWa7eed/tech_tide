import 'package:json_annotation/json_annotation.dart';

part 'user_register_request.g.dart';

@JsonSerializable(createFactory: false)
class UserRegisterRequest {
  final String username;
  final String email;
  @JsonKey(includeToJson: false)
  final String password;
  final bool status = true;
  final int likesCount = 0;
  final int postsCount = 0;
  final int repliesCount = 0;
  final String? imageUrl;
  final String? bio;

  UserRegisterRequest({
    required this.username,
    required this.email,
    required this.password,
    this.imageUrl,
    this.bio,
  });

  Map<String, dynamic> toJson() => _$UserRegisterRequestToJson(this);
}
