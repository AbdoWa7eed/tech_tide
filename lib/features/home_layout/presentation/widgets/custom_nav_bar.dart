import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:tech_tide/core/res/assets_manager.dart';
import 'package:tech_tide/core/res/color_manager.dart';
import 'package:tech_tide/core/res/strings_manager.dart';
import 'package:tech_tide/core/res/values_manager.dart';
import 'package:tech_tide/core/utils/extensions.dart';
import 'package:tech_tide/features/home_layout/presentation/provider/layout_controller.dart';

class CustomNavBarWidget extends StatelessWidget {
  CustomNavBarWidget({super.key});

  final List<BottomNavigationBarItem> items = [
    BottomNavigationBarItem(
      icon: SvgPicture.asset(
        AssetsManager.homeIcon,
      ),
      activeIcon: SvgPicture.asset(
        AssetsManager.homeIcon,
        colorFilter:
            const ColorFilter.mode(ColorManager.primary, BlendMode.srcIn),
      ),
      label: AppStrings.home.translate,
    ),
    BottomNavigationBarItem(
      icon: SvgPicture.asset(
        AssetsManager.eventsIcon,
      ),
      activeIcon: SvgPicture.asset(
        AssetsManager.eventsIcon,
        colorFilter:
            const ColorFilter.mode(ColorManager.primary, BlendMode.srcIn),
      ),
      label: AppStrings.events.translate,
    ),
    BottomNavigationBarItem(
      icon: SvgPicture.asset(AssetsManager.addPostIcon),
      activeIcon: SvgPicture.asset(
        AssetsManager.addPostIcon,
        colorFilter:
            const ColorFilter.mode(ColorManager.primary, BlendMode.srcIn),
      ),
      label: AppStrings.addPost.translate,
    ),
    BottomNavigationBarItem(
      icon: SvgPicture.asset(AssetsManager.chatsIcon),
      activeIcon: SvgPicture.asset(
        AssetsManager.chatsIcon,
        colorFilter:
            const ColorFilter.mode(ColorManager.primary, BlendMode.srcIn),
      ),
      label: AppStrings.chats.translate,
    ),
    BottomNavigationBarItem(
      icon: SvgPicture.asset(AssetsManager.profileIcon),
      activeIcon: SvgPicture.asset(
        AssetsManager.profileIcon,
        colorFilter:
            const ColorFilter.mode(ColorManager.primary, BlendMode.srcIn),
      ),
      label: AppStrings.profile.translate,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<LayoutController>(
      builder: (context, provider, child) {
        return Container(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: const BoxDecoration(
              color: ColorManager.white,
              boxShadow: [
                BoxShadow(
                  color: ColorManager.lightGray,
                  blurRadius: AppSize.s2,
                )
              ],
            ),
            child: BottomNavigationBar(
              backgroundColor: ColorManager.white,
              type: BottomNavigationBarType.fixed,
              showUnselectedLabels: true,
              currentIndex: provider.index,
              onTap: (index) {
                provider.setIndex(index);
              },
              items: items,
              selectedItemColor: ColorManager.primary,
              unselectedItemColor: ColorManager.black,
            ));
      },
    );
  }
}
