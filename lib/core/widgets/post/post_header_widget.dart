import 'package:flutter/material.dart';
import 'package:tech_tide/core/res/styles_manager.dart';
import 'package:tech_tide/core/res/values_manager.dart';
import 'package:tech_tide/core/widgets/post/saved_post_button.dart';

class PostHeaderWidget extends StatelessWidget {
  const PostHeaderWidget({
    super.key,
    required this.title,
    required this.subTitle,
    required this.imageUrl,
    this.isCanBeSaved = true,
  });

  final String title;
  final String subTitle;
  final String imageUrl;
  final bool isCanBeSaved;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          backgroundImage: NetworkImage(imageUrl),
        ),
        const SizedBox(width: AppSize.s12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: StylesManager.medium14,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                subTitle,
                style: StylesManager.regular12,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
        if (isCanBeSaved) ...[
          const SavedPostButton(),
        ]
      ],
    );
  }
}
