import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tech_tide/core/res/strings_manager.dart';
import 'package:tech_tide/core/res/styles_manager.dart';
import 'package:tech_tide/core/res/values_manager.dart';
import 'package:tech_tide/core/routes/routes_manager.dart';
import 'package:tech_tide/core/utils/extensions.dart';
import 'package:tech_tide/features/home/domain/entities/popular_topic_entity.dart';

class PopularTopicItem extends StatelessWidget {
  const PopularTopicItem({super.key, required this.color, required this.topic});

  final PopularTopicEntity topic;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(Routes.popularTopicsRoute, extra: topic.name);
      },
      child: SizedBox(
        height: AppSize.s140,
        width: AppSize.s140,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSize.s20),
          ),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          elevation: AppSize.s2,
          child: Container(
            color: color,
            padding: const EdgeInsets.symmetric(
              horizontal: AppPadding.p12,
              vertical: AppPadding.p12,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  topic.name,
                  style: StylesManager.bold18,
                ),
                Text(
                  '${topic.postsIds.length} ${AppStrings.posts.translate}',
                  style: StylesManager.medium16,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
