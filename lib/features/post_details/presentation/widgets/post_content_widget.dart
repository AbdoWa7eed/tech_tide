import 'package:flutter/material.dart';
import 'package:tech_tide/core/entities/post_entity.dart';
import 'package:tech_tide/core/res/styles_manager.dart';
import 'package:tech_tide/core/res/values_manager.dart';
import 'package:tech_tide/core/widgets/custom_readmore_text.dart';

class PostContentWidget extends StatelessWidget {
  const PostContentWidget({super.key, required this.post});
  final PostEntity post;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          post.title,
          style: StylesManager.semiBold18Black,
        ),
        const SizedBox(height: AppSize.s8),
        CustomReadmoreText(
          text: post.content,
        ),
      ],
    );
  }
}
