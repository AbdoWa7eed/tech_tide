import 'package:flutter/material.dart';
import 'package:tech_tide/core/res/values_manager.dart';
import 'package:tech_tide/features/add_post/presentation/widget/add_post_header_widget.dart';
import 'package:tech_tide/features/add_post/presentation/widget/add_post_title_widget.dart';
import 'package:tech_tide/features/add_post/presentation/widget/content_input_widget.dart';
import 'package:tech_tide/features/add_post/presentation/widget/tags_input_widget.dart';

class AddPostViewBody extends StatelessWidget {
  const AddPostViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
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
    );
  }
}
