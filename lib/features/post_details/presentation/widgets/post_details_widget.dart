import 'package:flutter/material.dart';
import 'package:tech_tide/core/res/color_manager.dart';
import 'package:tech_tide/core/res/values_manager.dart';
import 'package:tech_tide/core/widgets/post/post_tags_widget.dart';
import 'package:tech_tide/features/post_details/presentation/widgets/post_content_widget.dart';
import 'package:tech_tide/features/post_details/presentation/widgets/post_images_list_widget.dart';

class PostDetailsWidget extends StatelessWidget {
  const PostDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Card(
      color: ColorManager.white,
      elevation: AppSize.s2,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: AppPadding.p12, vertical: AppPadding.p12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //TODO: ADD POST TO THIS WIDGET
            // PostHeaderWidget(),
            SizedBox(height: AppSize.s16),
            PostContentWidget(),
            SizedBox(height: AppSize.s16),
            PostImagesListWidget(),
            SizedBox(height: AppSize.s16),
            PostTagsWidget(),
          ],
        ),
      ),
    );
  }
}
