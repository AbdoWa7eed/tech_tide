import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tech_tide/core/data/data_source/chats_data_source.dart';
import 'package:tech_tide/core/data/models/chats/chats_response_model.dart';
import 'package:tech_tide/core/res/color_manager.dart';
import 'package:tech_tide/core/res/strings_manager.dart';
import 'package:tech_tide/core/utils/extensions.dart';
import 'package:tech_tide/core/widgets/gradiant_app_bar.dart';
import 'package:tech_tide/features/chats/presentation/widgets/chat_tile.dart';

class Chatspage extends StatefulWidget {
  @override
  _ChatspageState createState() => _ChatspageState();
}

class _ChatspageState extends State<Chatspage> {
  late ChatsDataSource _chatsDataSource;
  late FirebaseAuth _fireaseAuth;
  late Stream<List<ChatResponseModel>> _chatsStream;
  @override
  void initState() {
    super.initState();

    // Initialize the ChatsDataSource with Firestore
    _chatsDataSource = ChatsDataSourceImpl(FirebaseFirestore.instance);
    _fireaseAuth = FirebaseAuth.instance;
    // Assuming you have the current user ID stored somewhere
    String userId = _fireaseAuth.currentUser!.uid; // Replace with actual userId

    // Get the stream of chats for this user
    _chatsStream = _chatsDataSource.getChatsForUser(userId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.babyBlue,
      appBar: GradientAppBar(title: AppStrings.chats.translate),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: StreamBuilder<List<ChatResponseModel>>(
            stream: _chatsStream,
            builder: (context, snapshot) {
              if (snapshot.hasData && snapshot.data != null) {
                return ListView.separated(
                    separatorBuilder: (context, index) => const Divider(
                          color: ColorManager.gray,
                        ),
                    itemCount: snapshot.data?.length ?? 0,
                    itemBuilder: (context, index) {
                      final chat = snapshot.data?[index];
                      if (chat != null) {
                        return ChatTile(chat: chat);
                      } else {
                        return const SizedBox.shrink();
                      }
                    });
              }
              return const Center(child: CircularProgressIndicator());
            }),
      )),
    );
  }
}
