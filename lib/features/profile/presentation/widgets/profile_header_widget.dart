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
import 'package:tech_tide/core/widgets/custom_snack_bar.dart';
import 'package:tech_tide/features/home_layout/presentation/cubit/layout_cubit.dart';
import 'package:tech_tide/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:tech_tide/features/profile/presentation/widgets/popup_menu_widget.dart';
import 'package:tech_tide/features/profile/presentation/widgets/profile_image_widget.dart';
import 'package:tech_tide/features/profile/presentation/widgets/user_bio_widget.dart';
import 'package:tech_tide/features/profile/presentation/widgets/user_stats_widget.dart';

class ProfileHeaderWidget extends StatefulWidget {
  const ProfileHeaderWidget({super.key});

  @override
  State<ProfileHeaderWidget> createState() => _ProfileHeaderWidgetState();
}

class _ProfileHeaderWidgetState extends State<ProfileHeaderWidget> {
  late FirebaseAuth _firebaseAuth;
  late ChatsDataSource _chatsDataSource;

  @override
  void initState() {
    _chatsDataSource = ChatsDataSourceImpl(FirebaseFirestore.instance);
    _firebaseAuth = FirebaseAuth.instance;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        final user = context.read<LayoutCubit>().user;
        final cubit = context.watch<ProfileCubit>();
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
                          imageUrl: cubit.profileEntity.user.imageUrl),
                      const PopupMenuWidget(),
                    ],
                  ),
                  const SizedBox(height: AppSize.s8),
                  if (user.userId != cubit.profileEntity.user.userId) ...[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          cubit.profileEntity.user.username,
                          style: StylesManager.semiBold18,
                        ),
                        const SizedBox(width: AppSize.s8),
                        GestureDetector(
                          onTap: () async {
                            String chatId = _chatsDataSource.generateChatId(
                                _firebaseAuth.currentUser!.uid,
                                cubit.profileEntity.user.userId);
                            bool chatExists =
                                await _chatsDataSource.doesChatExist(chatId);
                            if (!chatExists) {
                              _chatsDataSource.createChat(
                                  _firebaseAuth.currentUser!.uid,
                                  cubit.profileEntity.user.userId);
                            }
                            ChatResponseModel? chat =
                                await _chatsDataSource.getChatById(chatId);
                            if (chat == null) {
                              CustomSnackBar.error(
                                  "Cannot open chat for current time", context);
                            }
                            (context).push('/chat', extra: {
                              'chatuser': cubit.profileEntity.user.userId,
                              'currentUserId': _firebaseAuth.currentUser?.uid,
                              'chat': chat!
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
                      cubit.profileEntity.user.username,
                      style: StylesManager.semiBold18,
                    ),
                  ],
                  const Divider(
                    color: ColorManager.whiteWith40Opacity,
                  ),
                  UserBioWidget(
                    bio: cubit.profileEntity.user.bio,
                  ),
                  const SizedBox(height: AppSize.s8),
                  UserStatsWidget(user: cubit.profileEntity.user),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
