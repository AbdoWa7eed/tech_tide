import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
                  Text(
                    state.profileEntity.user.username,
                    style: StylesManager.semiBold18,
                  ),
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
