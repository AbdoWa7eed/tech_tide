import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tech_tide/core/res/color_manager.dart';
import 'package:tech_tide/core/res/strings_manager.dart';
import 'package:tech_tide/core/res/styles_manager.dart';
import 'package:tech_tide/core/res/values_manager.dart';
import 'package:tech_tide/core/utils/extensions.dart';
import 'package:tech_tide/core/widgets/post/post_widget.dart';
import 'package:tech_tide/features/home/presentation/cubit/home_cubit.dart';

class TrendingPostsWidget extends StatelessWidget {
  const TrendingPostsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<HomeCubit, HomeState, HomeLoaded>(
      selector: (state) => state as HomeLoaded,
      builder: (context, state) {
        if (state.trendingPosts.isEmpty) {
          return const SizedBox.shrink();
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppStrings.trendingPosts.translate,
              style: StylesManager.semiBold18.copyWith(
                color: ColorManager.black,
              ),
            ),
            const SizedBox(height: AppSize.s16),
            ListView.separated(
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return PostWidget(
                  post: state.trendingPosts[index],
                );
              },
              itemCount: state.trendingPosts.length,
              separatorBuilder: (context, index) => const SizedBox(
                height: AppSize.s16,
              ),
            ),
          ],
        );
      },
    );
  }
}
