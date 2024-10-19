import 'package:flutter/material.dart';
import 'package:tech_tide/core/res/color_manager.dart';
import 'package:tech_tide/core/res/strings_manager.dart';
import 'package:tech_tide/core/res/values_manager.dart';
import 'package:tech_tide/core/utils/extensions.dart';

class LikePostButton extends StatefulWidget {
  const LikePostButton(
      {super.key, this.onPressed, required this.likes, required this.isLiked});

  final Function()? onPressed;
  final int likes;
  final bool isLiked;

  @override
  State<LikePostButton> createState() => _LikePostButtonState();
}

class _LikePostButtonState extends State<LikePostButton> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        setState(() {
          widget.onPressed?.call();
        });
      },
      icon: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            widget.isLiked
                ? Icons.favorite_outlined
                : Icons.favorite_border_rounded,
            size: AppSize.s22,
            color: widget.isLiked ? ColorManager.error : null,
          ),
          const SizedBox(width: AppSize.s12), // Spacing
          Text(
            "${widget.likes} ${AppStrings.likes.translate}",
          ),
        ],
      ),
    );
  }
}
