import 'package:flutter/material.dart';
import 'package:tech_tide/core/res/strings_manager.dart';
import 'package:tech_tide/core/res/styles_manager.dart';
import 'package:tech_tide/core/res/values_manager.dart';
import 'package:tech_tide/core/utils/extensions.dart';
import 'package:tech_tide/features/post_details/presentation/widgets/post_reply_widget.dart';

class PostRepliesWidget extends StatelessWidget {
  const PostRepliesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.replies.translate,
          style: StylesManager.semiBold18Black,
        ),
        const SizedBox(height: AppSize.s12),
        ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.only(bottom: AppPadding.p40),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return const PostReplyWidget();
          },
          itemCount: 3,
          separatorBuilder: (context, index) => const SizedBox(
            height: AppSize.s12,
          ),
        )
      ],
    );
  }
}
