import 'package:flutter/material.dart';
import 'package:tech_tide/core/res/strings_manager.dart';
import 'package:tech_tide/core/res/styles_manager.dart';
import 'package:tech_tide/core/utils/extensions.dart';

class EmptyViewWidget extends StatelessWidget {
  const EmptyViewWidget({super.key, this.text, this.onTryAgain});
  final String? text;
  final VoidCallback? onTryAgain;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            text ?? AppStrings.noContent.translate,
            style: StylesManager.regular16,
          ),
          Visibility(
            visible: onTryAgain != null,
            child: TextButton(
              onPressed: onTryAgain,
              child: Text(AppStrings.reload.translate),
            ),
          )
        ],
      ),
    );
  }
}
