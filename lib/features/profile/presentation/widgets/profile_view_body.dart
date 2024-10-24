import 'package:flutter/material.dart';
import 'package:tech_tide/core/res/values_manager.dart';
import 'package:tech_tide/features/profile/presentation/widgets/recent_posts_widget.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppPadding.p20,
          vertical: AppPadding.p16,
        ),
        child: RecentPostsWidget());
  }
}
