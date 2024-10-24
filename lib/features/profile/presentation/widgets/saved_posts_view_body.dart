import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tech_tide/core/res/values_manager.dart';
import 'package:tech_tide/core/widgets/post/post_widget.dart';
import 'package:tech_tide/features/profile/presentation/cubit/profile_cubit.dart';

class SavedPostsViewBody extends StatelessWidget {
  const SavedPostsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(builder: (context, state) {
      final cubit = context.read<ProfileCubit>();

      return ListView.separated(
        padding: const EdgeInsets.symmetric(
          horizontal: AppPadding.p20,
          vertical: AppPadding.p16,
        ),
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return PostWidget(post: cubit.profileEntity.savedPosts[index]);
        },
        separatorBuilder: (context, index) => const SizedBox(
          height: AppSize.s16,
        ),
        itemCount: cubit.profileEntity.savedPosts.length,
      );
    });
  }
}
