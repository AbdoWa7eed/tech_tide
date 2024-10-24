import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:tech_tide/core/data/data_source/chats_data_source.dart';
import 'package:tech_tide/core/data/models/chats/chats_response_model.dart';
import 'package:tech_tide/core/res/assets_manager.dart';
import 'package:tech_tide/core/res/color_manager.dart';
import 'package:tech_tide/core/res/styles_manager.dart';
import 'package:tech_tide/core/res/values_manager.dart';
import 'package:tech_tide/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:tech_tide/features/profile/presentation/widgets/popup_menu_widget.dart';
import 'package:tech_tide/features/profile/presentation/widgets/profile_image_widget.dart';
import 'package:tech_tide/features/profile/presentation/widgets/user_bio_widget.dart';
import 'package:tech_tide/features/profile/presentation/widgets/user_stats_widget.dart';

class ProfileHeaderWidget extends StatelessWidget {
  const ProfileHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
      late FirebaseAuth _firebaseAuth;
      late ChatsDataSource _chatsDataSource;
       _firebaseAuth = FirebaseAuth.instance;
      _chatsDataSource = ChatsDataSourceImpl(FirebaseFirestore.instance);
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        final state = context.watch<ProfileCubit>().state as ProfileLoaded;
        return Container(
          decoration: const BoxDecoration(gradient: ColorManager.gradientColor),
          width: double.infinity,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppPadding.p20,
                vertical: AppPadding.p16,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ProfileImageWidget(
                          imageUrl: state.profileEntity.user.imageUrl),
                      const PopupMenuWidget(),
                    ],
                  ),
                  const SizedBox(height: AppSize.s8),
                  if (true) ...[
                    Row(
                      children: [
                        Text(
                          state.profileEntity.user.username,
                          style: StylesManager.semiBold18,
                        ),
                        const SizedBox(width: AppSize.s8),
                        GestureDetector(
                          onTap: () {   
                            String chatid = _chatsDataSource.generateChatId(_firebaseAuth.currentUser!.uid, otherUserId);
                            bool chatExists = _chatsDataSource.doesChatExist(chatid) as bool;
                            if(!chatExists){
                             _chatsDataSource.createChat( _firebaseAuth.currentUser!.uid, otherUserId);
                            }                      
                            ChatResponseModel chat = _chatsDataSource.getChatById(chatid) as ChatResponseModel;
                            (context).push('/chat', extra: {
                              'chatuser': otherUserId,
                              'currentUserId': _firebaseAuth.currentUser?.uid,
                              'chat': chat
                            });
                          },
                          child: SvgPicture.asset(
                            AssetsManager.messageIcon,
                          ),
                        ),
                      ],
                    )
                  ] else ...[
                    Text(
                      state.profileEntity.user.username,
                      style: StylesManager.semiBold18,
                    ),
                  ],
                  const Divider(
                    color: ColorManager.whiteWith40Opacity,
                  ),
                  UserBioWidget(
                    bio: state.profileEntity.user.bio,
                  ),
                  const SizedBox(height: AppSize.s8),
                  UserStatsWidget(user: state.profileEntity.user),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
