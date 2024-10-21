import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tech_tide/core/res/values_manager.dart';
import 'package:tech_tide/core/widgets/post/tag_container_widget.dart';
import 'package:tech_tide/features/post_details/presentation/cubit/post_details_cubit.dart';

class PostTagsWidget extends StatelessWidget {
  const PostTagsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      final tags = context.read<PostDetailsCubit>().post.tags;

      if (tags.isEmpty) {
        return const SizedBox.shrink();
      }

      return SizedBox(
        height: AppSize.s28,
        child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return TagContainerWidget(tag: tags[index]);
            },
            separatorBuilder: (context, index) =>
                const SizedBox(width: AppSize.s8),
            itemCount: tags.length),
      );
    });
  }
}
