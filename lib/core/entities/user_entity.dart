class UserEntity {
  final String userId;
  final String email;
  final String imageUrl;
  final String bio;
  final String username;
  final bool status;
  final int likesCount;
  final int postsCount;
  final int repliesCount;

  UserEntity(
      {required this.userId,
      required this.bio,
      required this.email,
      required this.imageUrl,
      required this.username,
      required this.status,
      required this.likesCount,
      required this.postsCount,
      required this.repliesCount});
}
