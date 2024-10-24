import 'package:flutter/material.dart';
import 'package:tech_tide/core/res/color_manager.dart';
import 'package:tech_tide/core/res/styles_manager.dart';
import 'package:tech_tide/core/widgets/custom_readmore_text.dart';

class UserBioWidget extends StatelessWidget {
  const UserBioWidget({super.key, required this.bio});
  final String bio;

  @override
  Widget build(BuildContext context) {
    return CustomReadmoreText(
      text: bio,
      colorClickableText: ColorManager.deepTeal,
      style: StylesManager.regular14White,
      trimLines: 1,
    );
  }
}
