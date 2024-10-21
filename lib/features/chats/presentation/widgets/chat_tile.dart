import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tech_tide/core/data/models/chats/chats_response_model.dart';
import 'package:tech_tide/core/res/assets_manager.dart';
import 'package:tech_tide/core/widgets/circled_network_image.dart';

class ChatTile extends StatelessWidget {
  final ChatResponseModel chat;
  final _fireaseAuth = FirebaseAuth.instance;
  ChatTile({
    super.key,
    required this.chat,
  });

  @override
  Widget build(BuildContext context) {
    String otherUserId = _fireaseAuth.currentUser!.uid == chat.participants[0]
        ? chat.participants[1]
        : chat.participants[0];

    UserProfile? otherUserProfile = chat.userProfileMap[otherUserId];
    return ListTile(
      contentPadding: EdgeInsets.zero,
      onTap: () async {
        (context).push('/chat', extra: {
          'chatuser': otherUserId,
          'currentUserId': _fireaseAuth.currentUser?.uid,
          'chat': chat
        });
      },
      leading: SizedBox(
        width:54,
        height:54,
        child: CircledNetworkImage(
          imageUrl: otherUserProfile?.imageUrl ?? '',
          radius: 27,
        ),
      ),
      title: Text(otherUserProfile?.username ?? ''),
      subtitle: Text(chat.lastMessage),
      trailing: Text(_toChatTime(chat.lastMessageTime)),
    );
  }

  String _toChatTime(DateTime dateTime) {
    return "${dateTime.hour}:${dateTime.minute}";
  }
}
