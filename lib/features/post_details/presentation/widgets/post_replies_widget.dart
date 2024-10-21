import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tech_tide/core/res/strings_manager.dart';
import 'package:tech_tide/core/res/styles_manager.dart';
import 'package:tech_tide/core/res/values_manager.dart';
import 'package:tech_tide/core/utils/extensions.dart';
import 'package:tech_tide/core/widgets/empty_widget.dart';
import 'package:tech_tide/features/post_details/presentation/cubit/post_details_cubit.dart';
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
        BlocBuilder<PostDetailsCubit, PostDetailsState>(
            builder: (context, state) {
          final replies = context.read<PostDetailsCubit>().post.replies;
          if (replies.isEmpty) {
            return EmptyViewWidget(text: AppStrings.noReplies.translate);
          }
          return ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.only(bottom: AppPadding.p40),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return PostReplyWidget(reply: replies[index]);
            },
            itemCount: replies.length,
            separatorBuilder: (context, index) => const SizedBox(
              height: AppSize.s12,
            ),
          );
        })
      ],
    );
  }
}
