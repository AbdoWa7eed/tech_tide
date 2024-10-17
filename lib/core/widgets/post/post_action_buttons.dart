import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tech_tide/core/res/assets_manager.dart';
import 'package:tech_tide/core/res/values_manager.dart';
import 'package:tech_tide/core/widgets/post/like_post_button.dart';

class PostActionButtons extends StatelessWidget {
  const PostActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const LikePostButton(),
        IconButton(
          onPressed: () {},
          icon: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                AssetsManager.commentIcon,
                height: AppSize.s22,
                width: AppSize.s22,
              ),
              const SizedBox(width: AppSize.s12),
              const Text(
                "120",
              ),
            ],
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.remove_red_eye_outlined,
                size: AppSize.s22,
              ),
              SizedBox(width: AppSize.s12),
              Text(
                "120",
              ),
            ],
          ),
        )
      ],
    );
  }
}
