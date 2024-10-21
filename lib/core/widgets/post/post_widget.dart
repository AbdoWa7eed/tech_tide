import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tech_tide/core/entities/post_entity.dart';
import 'package:tech_tide/core/res/color_manager.dart';
import 'package:tech_tide/core/res/values_manager.dart';
import 'package:tech_tide/core/routes/routes_manager.dart';
import 'package:tech_tide/core/widgets/post/post_action_buttons.dart';
import 'package:tech_tide/core/widgets/post/post_header_widget.dart';

class PostWidget extends StatelessWidget {
  const PostWidget({super.key, required this.post});

  final PostEntity post;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        log("HIII I'M TESTINNG");

        context.push(Routes.postDetailsRoute, extra: post.id);
      },
      child: Card(
        color: ColorManager.white,
        elevation: AppSize.s2,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppPadding.p12,
            vertical: AppPadding.p12,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PostHeaderWidget(post: post),
              const SizedBox(height: AppSize.s16),
              Text(
                post.content,
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
              ),
              const SizedBox(height: AppSize.s16),
              PostActionButtons(
                post: post,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
