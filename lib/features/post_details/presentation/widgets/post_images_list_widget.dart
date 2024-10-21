import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tech_tide/core/res/values_manager.dart';
import 'package:tech_tide/core/widgets/post/post_image_widget.dart';
import 'package:tech_tide/features/post_details/presentation/cubit/post_details_cubit.dart';

class PostImagesListWidget extends StatelessWidget {
  const PostImagesListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final images = context.read<PostDetailsCubit>().post.images;
    return Builder(builder: (context) {
      if (images.isEmpty) {
        return const SizedBox.shrink();
      }
      return SizedBox(
        height: AppSize.s80,
        child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return PostImageWidget(
                imageUrl: images[index],
              );
            },
            separatorBuilder: (context, index) =>
                const SizedBox(width: AppSize.s12),
            itemCount: images.length),
      );
    });
  }
}
