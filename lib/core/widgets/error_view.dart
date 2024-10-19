import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:tech_tide/core/res/assets_manager.dart';
import 'package:tech_tide/core/res/strings_manager.dart';
import 'package:tech_tide/core/res/styles_manager.dart';
import 'package:tech_tide/core/res/values_manager.dart';
import 'package:tech_tide/core/utils/extensions.dart';

class ErrorViewWidget extends StatelessWidget {
  const ErrorViewWidget({super.key, required this.error, this.onTryAgain});
  final String error;
  final VoidCallback? onTryAgain;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          LottieBuilder.asset(
            AssetsManager.errorJson,
            height: AppSize.s100,
            width: AppSize.s100,
          ),
          Text(
            error,
            style: StylesManager.medium18,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: AppSize.s16),
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
