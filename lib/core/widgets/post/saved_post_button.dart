import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tech_tide/core/res/assets_manager.dart';
import 'package:tech_tide/core/res/color_manager.dart';

class SavedPostButton extends StatefulWidget {
  const SavedPostButton({super.key, this.onPressed});

  final Function(bool isSaved)? onPressed;

  @override
  State<SavedPostButton> createState() => _SavedPostButtonState();
}

class _SavedPostButtonState extends State<SavedPostButton> {
  bool isSaved = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSaved = !isSaved;
          widget.onPressed?.call(isSaved);
        });
      },
      child: SvgPicture.asset(
        AssetsManager.saveIcon,
        colorFilter: isSaved
            ? const ColorFilter.mode(ColorManager.primary, BlendMode.srcIn)
            : null,
      ),
    );
  }
}
