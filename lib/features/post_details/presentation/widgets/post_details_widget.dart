import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tech_tide/core/res/color_manager.dart';
import 'package:tech_tide/core/res/values_manager.dart';
import 'package:tech_tide/core/widgets/post/post_header_widget.dart';
import 'package:tech_tide/core/widgets/post/post_tags_widget.dart';
import 'package:tech_tide/features/post_details/presentation/cubit/post_details_cubit.dart';
import 'package:tech_tide/features/post_details/presentation/widgets/post_content_widget.dart';
import 'package:tech_tide/features/post_details/presentation/widgets/post_images_list_widget.dart';

class PostDetailsWidget extends StatelessWidget {
  const PostDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final postDetails = context.read<PostDetailsCubit>().post;
    return Card(
      color: ColorManager.white,
      elevation: AppSize.s2,
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: AppPadding.p12, vertical: AppPadding.p12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PostHeaderWidget(
              post: postDetails.post,
              isDetails: true,
            ),
            const SizedBox(height: AppSize.s16),
            PostContentWidget(
              post: postDetails.post,
            ),
            const SizedBox(height: AppSize.s16),
            const PostImagesListWidget(),
            const SizedBox(height: AppSize.s16),
            const PostTagsWidget(),
          ],
        ),
      ),
    );
  }
}
