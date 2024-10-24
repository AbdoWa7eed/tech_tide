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
    this.style = StylesManager.regular12,
    this.trimLines = 3,
    this.colorClickableText = ColorManager.primary,
  });

  final String text;
  final int trimLines;
  final TextStyle style;
  final Color colorClickableText;

  @override
  Widget build(BuildContext context) {
    return ReadMoreText(
      text,
      style: style,
      trimMode: TrimMode.Line,
      trimLines: trimLines,
      colorClickableText: colorClickableText,
      trimCollapsedText: AppStrings.showMore.translate,
      trimExpandedText: ' ${AppStrings.showLess.translate}',
    );
  }
}
