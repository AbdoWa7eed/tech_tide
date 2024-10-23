import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tech_tide/core/res/strings_manager.dart';
import 'package:tech_tide/core/res/styles_manager.dart';
import 'package:tech_tide/core/utils/extensions.dart';

class AddPostHeaderWidget extends StatelessWidget {
  const AddPostHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(AppStrings.createPost.translate,
            style: StylesManager.semiBold16Black),
        IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => context.pop(),
        ),
      ],
    );
  }
}
