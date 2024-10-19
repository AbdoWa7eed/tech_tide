import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tech_tide/core/res/assets_manager.dart';
import 'package:tech_tide/core/res/color_manager.dart';
import 'package:tech_tide/core/res/values_manager.dart';
import 'package:tech_tide/features/add_post/presentation/widget/add_post_header_widget.dart';
import 'package:tech_tide/features/add_post/presentation/widget/add_post_title_widget.dart';
import 'package:tech_tide/features/add_post/presentation/widget/content_input_widget.dart';
import 'package:tech_tide/features/add_post/presentation/widget/tags_input_widget.dart';

class AddPostViewBody extends StatelessWidget {
  const AddPostViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const SingleChildScrollView(
          child: Column(
            children: [
              AddPostHeaderWidget(),
              SizedBox(height: AppSize.s20),
              AddPostTitleWidget(),
              SizedBox(height: AppSize.s20),
              ContentInputWidget(),
              SizedBox(height: AppSize.s20),
              TagsInputWidget(),
            ],
          ),
        ),
        Align(
          alignment: AlignmentDirectional.bottomEnd,
          child: FloatingActionButton(
            onPressed: () {},
            backgroundColor: ColorManager.primary,
            shape: const CircleBorder(),
            child: SvgPicture.asset(AssetsManager.sendIcon),
          ),
        ),
      ],
    );
  }
}
