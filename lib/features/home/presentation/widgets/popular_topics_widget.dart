import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tech_tide/core/res/color_manager.dart';
import 'package:tech_tide/core/res/strings_manager.dart';
import 'package:tech_tide/core/res/styles_manager.dart';
import 'package:tech_tide/core/res/values_manager.dart';
import 'package:tech_tide/core/utils/extensions.dart';
import 'package:tech_tide/features/home/presentation/cubit/home_cubit.dart';
import 'package:tech_tide/features/home/presentation/widgets/popular_topic_item.dart';

class PopularTopicsWidget extends StatelessWidget {
  const PopularTopicsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<HomeCubit, HomeState, HomeLoaded>(
      selector: (state) => state as HomeLoaded,
      builder: (context, state) {
        if (state.popularTopics.isEmpty) {
          return const SizedBox.shrink();
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppStrings.popularTopics.translate,
              style: StylesManager.semiBold18.copyWith(
                color: ColorManager.black,
              ),
            ),
            const SizedBox(height: AppSize.s16),
            SizedBox(
              height: AppSize.s140,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return PopularTopicItem(
                    color: ColorManager.popularTopicsColors[
                        index % ColorManager.popularTopicsColors.length],
                    topic: state.popularTopics[index],
                  );
                },
                itemCount: state.trendingPosts.length,
                separatorBuilder: (context, index) => const SizedBox(
                  width: AppSize.s8,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
