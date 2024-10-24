import 'package:flutter/material.dart';
import 'package:tech_tide/core/entities/user_entity.dart';
import 'package:tech_tide/core/res/color_manager.dart';
import 'package:tech_tide/core/res/styles_manager.dart';
import 'package:tech_tide/core/res/values_manager.dart';

class UserStatsWidget extends StatelessWidget {
  final UserEntity user;

  const UserStatsWidget({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppPadding.p8),
      decoration: BoxDecoration(
          color: ColorManager.white.withOpacity(0.2),
          borderRadius: BorderRadius.circular(AppSize.s12)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildStatItem('Posts', user.postsCount),
          _buildVerticalDivider(),
          _buildStatItem('Replies', user.repliesCount),
          _buildVerticalDivider(),
          _buildStatItem('Likes', user.likesCount),
        ],
      ),
    );
  }

  Widget _buildStatItem(String label, int value) {
    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(value.toString(), style: StylesManager.regular16White),
          const SizedBox(height: AppSize.s4),
          Text(label, style: StylesManager.regular16White),
        ],
      ),
    );
  }

  Widget _buildVerticalDivider() {
    return Container(
      height: 40,
      width: 1,
      color: Colors.white.withOpacity(0.3),
    );
  }
}
