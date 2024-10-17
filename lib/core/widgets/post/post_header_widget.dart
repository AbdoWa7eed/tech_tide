import 'package:flutter/material.dart';
import 'package:tech_tide/core/res/styles_manager.dart';
import 'package:tech_tide/core/res/values_manager.dart';
import 'package:tech_tide/core/widgets/post/saved_post_button.dart';

class PostHeaderWidget extends StatelessWidget {
  const PostHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          backgroundImage: NetworkImage('https://i.pravatar.cc/300'),
        ),
        SizedBox(width: AppSize.s12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'C++ in a nutshell',
                style: StylesManager.medium14,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                'Mohammed',
                style: StylesManager.regular12,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
        SavedPostButton(),
      ],
    );
  }
}
