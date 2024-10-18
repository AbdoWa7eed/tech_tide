import 'package:flutter/material.dart';
import 'package:tech_tide/core/res/values_manager.dart';
import 'package:tech_tide/core/widgets/post/post_image_widget.dart';

class PostImagesListWidget extends StatelessWidget {
  const PostImagesListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSize.s80,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return const PostImageWidget();
          },
          separatorBuilder: (context, index) =>
              const SizedBox(width: AppSize.s12),
          itemCount: 2),
    );
  }
}
