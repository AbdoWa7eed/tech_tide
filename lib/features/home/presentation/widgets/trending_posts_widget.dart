import 'package:flutter/material.dart';
import 'package:tech_tide/core/res/color_manager.dart';
import 'package:tech_tide/core/res/strings_manager.dart';
import 'package:tech_tide/core/res/styles_manager.dart';
import 'package:tech_tide/core/res/values_manager.dart';
import 'package:tech_tide/core/utils/extensions.dart';
import 'package:tech_tide/core/widgets/post/post_widget.dart';

class TrendingPostsWidget extends StatelessWidget {
  const TrendingPostsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.trendingPosts.translate,
          style: StylesManager.semiBold18.copyWith(
            color: ColorManager.black,
          ),
        ),
        const SizedBox(height: AppSize.s16),
        ListView.separated(
          padding: EdgeInsets.zero,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return const PostWidget();
          },
          itemCount: 5,
          separatorBuilder: (context, index) => const SizedBox(
            height: AppSize.s16,
          ),
        ),
      ],
    );
  }
}
