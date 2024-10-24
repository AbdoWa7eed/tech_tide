import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tech_tide/core/res/strings_manager.dart';
import 'package:tech_tide/core/utils/extensions.dart';
import 'package:tech_tide/core/widgets/empty_widget.dart';
import 'package:tech_tide/core/widgets/gradiant_app_bar.dart';
import 'package:tech_tide/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:tech_tide/features/profile/presentation/widgets/saved_posts_view_body.dart';

class SavedPostsView extends StatelessWidget {
  const SavedPostsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(title: AppStrings.savedPosts.translate),
      body: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          final cubit = context.read<ProfileCubit>();
          if (cubit.profileEntity.savedPosts.isEmpty) {
            return const EmptyViewWidget();
          }
          return const SavedPostsViewBody();
        },
      ),
    );
  }
}
