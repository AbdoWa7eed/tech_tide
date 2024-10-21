import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tech_tide/core/entities/post_entity.dart';
import 'package:tech_tide/core/res/styles_manager.dart';
import 'package:tech_tide/core/res/values_manager.dart';
import 'package:tech_tide/core/utils/extensions.dart';
import 'package:tech_tide/core/widgets/circled_network_image.dart';
import 'package:tech_tide/core/widgets/post/saved_post_button.dart';
import 'package:tech_tide/features/home_layout/presentation/cubit/layout_cubit.dart';
import 'package:tech_tide/features/manage_post/presentation/cubit/manage_post_cubit.dart';

class PostHeaderWidget extends StatelessWidget {
  const PostHeaderWidget({
    super.key,
    required this.post,
    this.isDetails = false,
  });

  final PostEntity post;
  final bool isDetails;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircledNetworkImage(
          imageUrl: post.user.imageUrl,
        ),
        const SizedBox(width: AppSize.s12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                isDetails ? post.user.username : post.title,
                style: StylesManager.medium14,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                isDetails ? post.createdAt.timeAgo : post.user.username,
                style: StylesManager.regular12,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
        SavedPostButton(
          initialValue: isSaved(context),
          onPressed: (isSaved) {
            context.read<ManagePostCubit>().toggleSavePost(post.id);
          },
        ),
      ],
    );
  }

  bool isSaved(BuildContext context) {
    final user = context.read<LayoutCubit>().user;
    return user.savedPosts.contains(post.id);
  }
}
