import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tech_tide/core/res/color_manager.dart';
import 'package:tech_tide/core/res/values_manager.dart';
import 'package:tech_tide/core/utils/extensions.dart';
import 'package:tech_tide/core/widgets/custom_readmore_text.dart';
import 'package:tech_tide/core/widgets/post/like_post_button.dart';
import 'package:tech_tide/features/home_layout/presentation/cubit/layout_cubit.dart';
import 'package:tech_tide/features/post_details/domain/entities/post_details_entity.dart';
import 'package:tech_tide/features/post_details/presentation/widgets/reply_header_widget.dart';

import '../cubit/post_details_cubit.dart';

class PostReplyWidget extends StatelessWidget {
  const PostReplyWidget({super.key, required this.reply});

  final ReplyEntity reply;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: ColorManager.white,
      elevation: AppSize.s2,
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: AppPadding.p12, vertical: AppPadding.p12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ReplyHeaderWidget(
              title: reply.user.username,
              subTitle: reply.createdAt.timeAgo,
              imageUrl: reply.user.imageUrl,
            ),
            const SizedBox(
              height: AppSize.s12,
            ),
            CustomReadmoreText(
              text: reply.content,
            ),
            LikePostButton(
              isLiked: isLiked(context),
              onPressed: () {
                context.read<PostDetailsCubit>().toggleLikeReply(reply.replyId);
              },
              likes: reply.likes.length,
            )
          ],
        ),
      ),
    );
  }

  bool isLiked(BuildContext context) {
    final user = context.read<LayoutCubit>().user;
    return reply.likes.contains(user.userId);
  }
}
