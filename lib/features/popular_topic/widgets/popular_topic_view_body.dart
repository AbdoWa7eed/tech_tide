import 'package:flutter/material.dart';
import 'package:tech_tide/core/res/values_manager.dart';
import 'package:tech_tide/core/widgets/post/post_widget.dart';

class PopularTopicViewBody extends StatelessWidget {
  const PopularTopicViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(
        vertical: AppPadding.p18,
        horizontal: AppPadding.p18,
      ),
      itemBuilder: (context, index) {
        return const PostWidget();
      },
      separatorBuilder: (context, index) => const SizedBox(height: AppSize.s16),
      itemCount: 6,
    );
  }
}
