import 'package:flutter/material.dart';
import 'package:tech_tide/core/res/color_manager.dart';
import 'package:tech_tide/core/res/values_manager.dart';
import 'package:tech_tide/features/post_details/presentation/views/full_screen_image_view.dart';

class PostImageWidget extends StatelessWidget {
  const PostImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showImageDialog(context);
      },
      child: Container(
        height: AppSize.s80,
        width: AppSize.s80,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSize.s12),
          color: ColorManager.primaryWith10Opacity,
        ),
        child: Image.network("https://i.pravatar.cc/400"),
      ),
    );
  }

  void showImageDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return const FullScreenImageView(
              imageUrl: "https://i.pravatar.cc/400");
        });
  }
}