import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tech_tide/core/data/data_source/chats_data_source.dart';
import 'package:tech_tide/core/data/models/chats/chat_response_model.dart';
import 'package:tech_tide/core/data/models/chats/chats_response_model.dart';
import 'package:tech_tide/core/data/models/chats/message_response_model.dart';
import 'package:tech_tide/core/res/assets_manager.dart';
import 'package:tech_tide/core/res/color_manager.dart';
import 'package:tech_tide/core/widgets/gradiant_app_bar.dart';
import 'package:dash_chat_2/dash_chat_2.dart';

class ChatPage extends StatefulWidget {
  final String chatuserID;
  final String currentUserId;
  final ChatResponseModel chat;
  const ChatPage(
      {super.key,
      required this.chatuserID,
      required this.chat,
      required this.currentUserId});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  late ChatsDataSource _chatsDataSource;
  Map<String, UserProfile>? userProfileMap;
  ChatUser? currentUser, otherUser;

  @override
  void initState() {
    super.initState();
    _chatsDataSource = ChatsDataSourceImpl(FirebaseFirestore.instance);
    _fetchUserProfile(widget.chatuserID);
    currentUser = ChatUser(
      id: widget.currentUserId,
      firstName: widget.chat.userProfileMap[widget.currentUserId]?.username,
    );
    otherUser = ChatUser(
        id: widget.chatuserID,
        firstName: widget.chat.userProfileMap[widget.chatuserID]?.username,
        profileImage: widget.chat.userProfileMap[widget.chatuserID]?.imageUrl);
  }

  Future<void> _fetchUserProfile(String userId) async {
    final userProfile = await _chatsDataSource.getUserProfile(userId);
    setState(() {
      userProfileMap = userProfile;
    });
  }

  Future<void> _sendMessage(ChatMessage chatmessage) async {
    Message message = Message(
      senderID: currentUser!.id,
      content: chatmessage.text,
      sentAt: Timestamp.fromDate(chatmessage.createdAt),
    );
    await _chatsDataSource.sendChatMessage(widget.chat.chatId, message);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorManager.babyBlue,
        appBar: GradientAppBar(
          title: userProfileMap?[widget.chatuserID]?.username ??
              '',
        ),
        body: StreamBuilder(
          stream: _chatsDataSource.getChatMessages(widget.chat.chatId),
          builder: (context, snapshot) {
            Chat? chat = snapshot.data;
            List<ChatMessage> messages = [];
            if (chat != null && chat.messages != null) {
              messages = _generateChatMessages(chat.messages!);
            }
            return DashChat(
              messageOptions: const MessageOptions(
                showOtherUsersAvatar: true,
                showTime: true,
                currentUserContainerColor: ColorManager.primary,
                containerColor: ColorManager.babyBlue2,
              ),
              inputOptions: InputOptions(
                alwaysShowSend: true,
                sendButtonBuilder: (onSend) {
                  return Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: ColorManager.primary,
                    ),
                    child: IconButton(
                      icon: SvgPicture.asset(AssetsManager.sendIcon),
                      onPressed: onSend,
                    ),
                  );
                },
              ),
              currentUser: currentUser!,
              onSend: _sendMessage,
              messages: messages,
            );
          },
        ));
  }

  List<ChatMessage> _generateChatMessages(List<Message> messages) {
    List<ChatMessage> chatMessages = messages
        .map((message) => ChatMessage(
              user: message.senderID == currentUser!.id
                  ? currentUser!
                  : otherUser!,
              createdAt: message.sentAt!.toDate(),
              text: message.content!,
            ))
        .toList();
    chatMessages.sort((a, b) => b.createdAt.compareTo(a.createdAt));
    return chatMessages;
  }
}
