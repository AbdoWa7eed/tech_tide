import 'package:flutter/material.dart';
import 'package:tech_tide/core/res/strings_manager.dart';
import 'package:tech_tide/core/res/styles_manager.dart';
import 'package:tech_tide/core/utils/extensions.dart';

class EmptyViewWidget extends StatelessWidget {
  const EmptyViewWidget({super.key, this.text});
  final String? text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        text ?? AppStrings.noContent.translate,
        style: StylesManager.regular16,
      ),
    );
  }
}
