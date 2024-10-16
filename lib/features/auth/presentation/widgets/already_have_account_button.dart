import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tech_tide/core/res/color_manager.dart';
import 'package:tech_tide/core/res/strings_manager.dart';
import 'package:tech_tide/core/res/styles_manager.dart';
import 'package:tech_tide/core/utils/extensions.dart';

class AlreadyHaveAccountButton extends StatelessWidget {
  const AlreadyHaveAccountButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          AppStrings.alreadyHaveAccount.translate,
          style: StylesManager.medium14,
        ),
        TextButton(
          onPressed: () {
            context.pop();
          },
          child: Text(
            AppStrings.login.translate,
            style: StylesManager.medium14.copyWith(color: ColorManager.primary),
          ),
        )
      ],
    );
  }
}
