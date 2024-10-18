import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tech_tide/core/res/color_manager.dart';

class CustomBackButton extends StatelessWidget {
  final IconData? icon;

  const CustomBackButton({super.key, this.icon});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        icon ?? Icons.arrow_back_ios_new_rounded,
        color: ColorManager.white,
      ),
      onPressed: () {
        context.pop();
      },
    );
  }
}
