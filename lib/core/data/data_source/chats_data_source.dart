import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tech_tide/core/data/models/chats/chat_response_model.dart';
import 'package:tech_tide/core/data/models/chats/chats_response_model.dart';
import 'package:tech_tide/core/data/models/chats/message_response_model.dart';
import 'package:tech_tide/core/data/models/user/user_response_model.dart';
import 'package:tech_tide/core/network/firebase_constants.dart';

abstract class ChatsDataSource {
  Stream<List<ChatResponseModel>> getChatsForUser(String userId);

  Future<Map<String, UserProfile>> getUserProfile(String userId);

  Future<void> sendChatMessage(String chatId, Message message);

  Stream<Chat> getChatMessages(String chatId);

  Future<void> createChat(String userId, String otherUserId);

  Future<ChatResponseModel?> getChatById(String chatId);

  String generateChatId(String userId, String otherUserId);

  Future<bool> doesChatExist(String chatId);
}

class ChatsDataSourceImpl implements ChatsDataSource {
  final FirebaseFirestore _firebaseFirestore;

  ChatsDataSourceImpl(this._firebaseFirestore);

  @override
  Stream<List<ChatResponseModel>> getChatsForUser(String userId) {
    // Listen to user chats subcollection
    final userChatsQuery = _firebaseFirestore
        .collection(FirebaseConstants.usersCollection)
        .doc(userId)
        .collection(FirebaseConstants.chatsCollection)
        .snapshots();

    return userChatsQuery.asyncExpand((snapshot) {
      final chatIds = snapshot.docs.map((doc) => doc.id).toList();

      if (chatIds.isEmpty) {
        return Stream.value([]);
      }

      // Listen to changes in chat details
      final chatDetailsQuery = _firebaseFirestore
          .collection(FirebaseConstants.chatsCollection)
          .where(FieldPath.documentId, whereIn: chatIds)
          .snapshots();

      return chatDetailsQuery.asyncMap((querySnapshot) async {
        final List<ChatResponseModel> chats = [];

        for (var doc in querySnapshot.docs) {
          final chatData = doc.data();
          final List<String> participants =
              List<String>.from(chatData['Participants']);

          // Fetch user profiles for participants
          final Map<String, UserProfile> userProfileMap =
              await _getUserProfiles(participants);

          // Build the ChatResponseModel with user profile data
          chats.add(ChatResponseModel.fromJson(chatData, userProfileMap));
        }

        return chats;
      });
    });
  }

  Future<Map<String, UserProfile>> _getUserProfiles(
      List<String> userIds) async {
    final usersQuery = await _firebaseFirestore
        .collection(FirebaseConstants.usersCollection)
        .where(FieldPath.documentId, whereIn: userIds)
        .get();

    final Map<String, UserProfile> userProfiles = {};

    for (var userDoc in usersQuery.docs) {
      final userData = UserResponseModel.fromJson(userDoc.data());
      userProfiles[userData.userId!] = UserProfile.fromUserResponse(userData);
    }

    return userProfiles;
  }

  @override
  Future<Map<String, UserProfile>> getUserProfile(String userId) async {
    final userDoc = await _firebaseFirestore
        .collection(FirebaseConstants.usersCollection)
        .doc(userId)
        .get();

    final userData = UserResponseModel.fromJson(userDoc.data() ?? {});
    return {userData.userId!: UserProfile.fromUserResponse(userData)};
  }

  @override
  Future<void> sendChatMessage(String chatId, Message message) async {
    final chatRef = _firebaseFirestore
        .collection(FirebaseConstants.chatsCollection)
        .doc(chatId);

    final messageData = message.toJson();
    await chatRef.update({
      "messages": FieldValue.arrayUnion([messageData]),
      "LastMessage": messageData['content'],
      "LastMessageTime": messageData['sentAt'],
    });
  }

  @override
  Stream<Chat> getChatMessages(String chatId) {
    return _firebaseFirestore
        .collection(FirebaseConstants.chatsCollection)
        .doc(chatId)
        .snapshots()
        .map((snapshot) {
      return Chat.fromJson(snapshot.data() ?? {});
    });
  }

  @override
  String generateChatId(String userId, String otherUserId) {
    List userIds = [userId, otherUserId];
    userIds.sort();
    String chatId = userIds.fold("", (id, uid) => "$id$uid");
    return chatId;
  }

  @override
  Future<void> createChat(String userId, String otherUserId) async {
    final chatId = generateChatId(userId, otherUserId);

    final chatRef = _firebaseFirestore
        .collection(FirebaseConstants.chatsCollection)
        .doc(chatId);

    final chatData = {
      "Participants": [userId, otherUserId],
      "LastMessage": "",
      "LastMessageTime": DateTime.now(),
      "ChatID": chatRef.id,
      "messages": [],
    };

    await chatRef.set(chatData);

    await _firebaseFirestore
        .collection(FirebaseConstants.usersCollection)
        .doc(userId)
        .collection(FirebaseConstants.chatsCollection)
        .doc(chatId)
        .set({});
  }

  @override
  Future<bool> doesChatExist(String chatId) async {
    final chatDoc = await _firebaseFirestore
        .collection(FirebaseConstants.chatsCollection)
        .doc(chatId)
        .get();

    return chatDoc.exists;
  }

  @override
  Future<ChatResponseModel?> getChatById(String chatId) async {
    final chatDoc = await _firebaseFirestore
        .collection(FirebaseConstants.chatsCollection)
        .doc(chatId)
        .get();

    if (chatDoc.exists) {
      final chatData = chatDoc.data();
      final List<String> participants =
          List<String>.from(chatData?['Participants'] ?? []);

      final Map<String, UserProfile> userProfileMap =
          await _getUserProfiles(participants);

      return ChatResponseModel.fromJson(chatData!, userProfileMap);
    } else {
      return null;
    }
  }
}
