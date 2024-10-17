import 'package:flutter/material.dart';
import 'package:tech_tide/core/res/color_manager.dart';
import 'package:tech_tide/core/res/values_manager.dart';

class LikePostButton extends StatefulWidget {
  const LikePostButton({super.key, this.onPressed});
  final Function(bool isLiked)? onPressed;

  @override
  State<LikePostButton> createState() => _LikePostButtonState();
}

class _LikePostButtonState extends State<LikePostButton> {
  bool isLiked = false;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        setState(() {
          isLiked = !isLiked;
          widget.onPressed?.call(isLiked);
        });
      },
      icon: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            isLiked ? Icons.favorite_outlined : Icons.favorite_border_rounded,
            size: AppSize.s22,
            color: isLiked ? ColorManager.error : null,
          ),
          const SizedBox(width: AppSize.s12), // Spacing
          const Text(
            "120",
          ),
        ],
      ),
    );
  }
}
