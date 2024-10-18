import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tech_tide/core/res/styles_manager.dart';
import 'package:tech_tide/core/res/values_manager.dart';
import 'package:tech_tide/core/routes/routes_manager.dart';

class PopularTopicItem extends StatelessWidget {
  const PopularTopicItem({super.key, required this.color});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(Routes.popularTopicsRoute);
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
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'C++',
                  style: StylesManager.bold18,
                ),
                Text(
                  '10 Posts',
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
