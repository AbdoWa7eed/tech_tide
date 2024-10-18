import 'package:flutter/material.dart';
import 'package:tech_tide/core/res/color_manager.dart';
import 'package:tech_tide/core/res/styles_manager.dart';
import 'package:tech_tide/core/res/values_manager.dart';

class TagContainerWidget extends StatelessWidget {
  const TagContainerWidget({super.key, required this.tag});
  final String tag;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSize.s30,
      width: AppSize.s80,
      decoration: BoxDecoration(
          color: ColorManager.babyBlue,
          borderRadius: BorderRadius.circular(AppSize.s8)),
      child: Center(
        child: Text(
          tag,
          style: StylesManager.regular12,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
