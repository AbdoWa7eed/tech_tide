import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:tech_tide/core/res/color_manager.dart';
import 'package:tech_tide/core/res/strings_manager.dart';
import 'package:tech_tide/core/res/styles_manager.dart';
import 'package:tech_tide/core/utils/extensions.dart';

class CustomReadmoreText extends StatelessWidget {
  const CustomReadmoreText({
    super.key,
    required this.text,
    this.trimLines = 3,
  });

  final String text;
  final int trimLines;

  @override
  Widget build(BuildContext context) {
    return ReadMoreText(
      text,
      style: StylesManager.regular12,
      trimMode: TrimMode.Line,
      trimLines: trimLines,
      colorClickableText: ColorManager.primary,
      trimCollapsedText: AppStrings.showMore.translate,
      trimExpandedText: ' ${AppStrings.showLess.translate}',
    );
  }
}
