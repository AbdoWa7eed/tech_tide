import 'package:flutter/material.dart';
import 'package:tech_tide/core/res/values_manager.dart';
import 'package:tech_tide/core/widgets/post/tag_container_widget.dart';

class PostTagsWidget extends StatelessWidget {
  const PostTagsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSize.s28,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return const TagContainerWidget(tag: "C++");
          },
          separatorBuilder: (context, index) =>
              const SizedBox(width: AppSize.s8),
          itemCount: 2),
    );
  }
}
