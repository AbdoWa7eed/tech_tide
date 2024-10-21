import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tech_tide/core/data/models/user/user_response_model.dart';

class ChatResponseModel {
  final String chatId;
  final String lastMessage;
  final DateTime lastMessageTime;
  final List<String> participants;
  final Map<String, UserProfile> userProfileMap; // userId: UserProfile

  ChatResponseModel({
    required this.chatId,
    required this.lastMessage,
    required this.lastMessageTime,
    required this.participants,
    required this.userProfileMap,
  });

  factory ChatResponseModel.fromJson(Map<String, dynamic> json, Map<String, UserProfile> userProfiles) {
    return ChatResponseModel(
      chatId: json['ChatID'],
      lastMessage: json['LastMessage'],
      lastMessageTime: (json['LastMessageTime'] as Timestamp).toDate(),
      participants: List<String>.from(json['Participants']),
      userProfileMap: userProfiles,
    );
  }
}

class UserProfile {
  final String username;
  final String imageUrl;

  UserProfile({required this.username, required this.imageUrl});

  factory UserProfile.fromUserResponse(UserResponseModel user) {
    return UserProfile(
      username: user.username ?? '',
      imageUrl: user.imageUrl ?? '',
    );
  }
}
