import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:tech_tide/core/entities/post_entity.dart';
import 'package:tech_tide/core/res/assets_manager.dart';
import 'package:tech_tide/core/res/strings_manager.dart';
import 'package:tech_tide/core/res/values_manager.dart';
import 'package:tech_tide/core/routes/routes_manager.dart';
import 'package:tech_tide/core/utils/extensions.dart';
import 'package:tech_tide/core/widgets/post/like_post_button.dart';
import 'package:tech_tide/features/home_layout/presentation/cubit/layout_cubit.dart';
import 'package:tech_tide/features/manage_post/presentation/cubit/manage_post_cubit.dart';

class PostActionButtons extends StatelessWidget {
  const PostActionButtons({super.key, required this.post});

  final PostEntity post;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ManagePostCubit, ManagePostState>(
      builder: (context, state) {
        return Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          LikePostButton(
            isLiked: isLiked(context),
            onPressed: () {
              context.read<ManagePostCubit>().toggleLikePost(post.id);
            },
            likes: post.likes.length,
          ),
          IconButton(
            onPressed: () {
              context.push(Routes.postDetailsRoute, extra: post.id);
            },
            icon: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(
                  AssetsManager.commentIcon,
                  height: AppSize.s22,
                  width: AppSize.s22,
                ),
                const SizedBox(width: AppSize.s12),
                Text(
                  "${post.replies} ${AppStrings.replies.translate}",
                ),
              ],
            ),
          ),
        ]);
      },
    );
  }

  bool isLiked(BuildContext context) {
    final user = context.read<LayoutCubit>().user;
    return post.likes.contains(user.userId);
  }
}
