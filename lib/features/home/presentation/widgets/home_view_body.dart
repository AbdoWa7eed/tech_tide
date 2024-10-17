import 'package:flutter/material.dart';
import 'package:tech_tide/core/res/values_manager.dart';
import 'package:tech_tide/features/home/presentation/widgets/popular_topics_widget.dart';
import 'package:tech_tide/features/home/presentation/widgets/trending_posts_widget.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(
          horizontal: AppPadding.p18, vertical: AppPadding.p16),
      child: Column(
        children: [
          PopularTopicsWidget(),
          SizedBox(height: AppSize.s20),
          TrendingPostsWidget(),
        ],
      ),
    );
  }
}
