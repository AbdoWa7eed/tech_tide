import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tech_tide/core/res/values_manager.dart';
import 'package:tech_tide/core/widgets/empty_widget.dart';
import 'package:tech_tide/core/widgets/post/post_widget.dart';
import 'package:tech_tide/features/popular_topic/presentation/cubit/popular_topic_cubit.dart';

class PopularTopicViewBody extends StatelessWidget {
  const PopularTopicViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<PopularTopicCubit, PopularTopicState,
        PopularTopicLoaded>(
      selector: (state) => state as PopularTopicLoaded,
      builder: (context, state) {
        if (state.posts.isEmpty) {
          return const EmptyViewWidget();
        }
        return ListView.separated(
          padding: const EdgeInsets.symmetric(
            vertical: AppPadding.p18,
            horizontal: AppPadding.p18,
          ),
          itemBuilder: (context, index) {
            return PostWidget(post: state.posts[index]);
          },
          separatorBuilder: (context, index) =>
              const SizedBox(height: AppSize.s16),
          itemCount: state.posts.length,
        );
      },
    );
  }
}
