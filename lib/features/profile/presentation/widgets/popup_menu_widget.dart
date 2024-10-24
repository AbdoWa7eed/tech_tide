import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:tech_tide/core/res/assets_manager.dart';
import 'package:tech_tide/core/res/color_manager.dart';
import 'package:tech_tide/core/res/styles_manager.dart';
import 'package:tech_tide/core/res/values_manager.dart';
import 'package:tech_tide/core/routes/routes_manager.dart';
import 'package:tech_tide/features/home_layout/presentation/cubit/layout_cubit.dart';
import 'package:tech_tide/features/profile/presentation/cubit/profile_cubit.dart';

class PopupMenuWidget extends StatelessWidget {
  const PopupMenuWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final user = context.read<LayoutCubit>().user;
    final cubit = context.read<ProfileCubit>();
    return Visibility(
      visible: user.userId == cubit.profileEntity.user.userId,
      child: PopupMenuButton<String>(
        color: ColorManager.babyBlue,
        icon: const Icon(
          Icons.more_vert_rounded,
          color: ColorManager.white,
        ),
        onSelected: (value) {
          switch (value) {
            case 'logout':
              cubit.logout();
              break;
            case 'saved_posts':
              context.push(Routes.savedPostsRoute);
              break;
            case 'change_language':
              break;
          }
        },
        itemBuilder: (BuildContext context) => [
          PopupMenuItem<String>(
            value: 'saved_posts',
            child: Row(
              children: [
                SvgPicture.asset(
                  AssetsManager.saveIcon,
                  colorFilter: const ColorFilter.mode(
                    ColorManager.primary,
                    BlendMode.srcIn,
                  ),
                ),
                const SizedBox(width: AppSize.s10),
                const Text(
                  'Saved Posts',
                  style: StylesManager.regular14,
                ),
              ],
            ),
          ),
          const PopupMenuItem<String>(
            value: 'change_language',
            padding: EdgeInsets.symmetric(horizontal: AppPadding.p8),
            child: Row(
              children: [
                Icon(Icons.language_outlined),
                SizedBox(width: AppSize.s10),
                Text(
                  'Change language',
                  style: StylesManager.regular14,
                ),
              ],
            ),
          ),
          PopupMenuItem<String>(
            value: 'logout',
            child: Row(
              children: [
                SvgPicture.asset(
                  AssetsManager.logoutIcon,
                  colorFilter: const ColorFilter.mode(
                    ColorManager.error,
                    BlendMode.srcIn,
                  ),
                ),
                const SizedBox(width: AppSize.s10),
                const Text(
                  'Logout',
                  style: StylesManager.regular14,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
