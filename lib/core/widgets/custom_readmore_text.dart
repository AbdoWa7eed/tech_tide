import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:tech_tide/core/res/color_manager.dart';
import 'package:tech_tide/core/res/strings_manager.dart';
import 'package:tech_tide/core/res/styles_manager.dart';
import 'package:tech_tide/core/utils/extensions.dart';

class CustomReadmoreText extends StatelessWidget {
  const CustomReadmoreText({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return ReadMoreText(
      text,
      style: StylesManager.regular12,
      trimMode: TrimMode.Line,
      trimLines: 3,
      colorClickableText: ColorManager.primary,
      trimCollapsedText: AppStrings.showMore.translate,
      trimExpandedText: ' ${AppStrings.showLess.translate}',
    );
  }
}
