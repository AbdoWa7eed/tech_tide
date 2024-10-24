import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tech_tide/core/res/strings_manager.dart';
import 'package:tech_tide/core/res/styles_manager.dart';
import 'package:tech_tide/core/res/values_manager.dart';
import 'package:tech_tide/core/utils/extensions.dart';
import 'package:tech_tide/core/widgets/post/post_widget.dart';
import 'package:tech_tide/features/profile/presentation/cubit/profile_cubit.dart';

class RecentPostsWidget extends StatelessWidget {
  const RecentPostsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        final cubit = context.read<ProfileCubit>();
        if (cubit.profileEntity.posts.isEmpty) {
          return const SizedBox.shrink();
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppStrings.recentPosts.translate,
              style: StylesManager.medium18,
            ),
            const SizedBox(height: AppSize.s8),
            ListView.separated(
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return PostWidget(post: cubit.profileEntity.posts[index]);
              },
              separatorBuilder: (context, index) => const SizedBox(
                height: AppSize.s16,
              ),
              itemCount: cubit.profileEntity.posts.length,
            ),
          ],
        );
      },
    );
  }
}
