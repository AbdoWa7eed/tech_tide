import 'package:flutter/material.dart';
import 'package:tech_tide/core/res/color_manager.dart';
import 'package:tech_tide/core/res/values_manager.dart';
import 'package:tech_tide/features/add_post/presentation/views/add_post_listener.dart';
import 'package:tech_tide/features/add_post/presentation/widget/add_post_view_body.dart';

class AddPostView extends StatelessWidget {
  const AddPostView({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return AddPostListenerWidget(
      child: Container(
        height: height * 0.95,
        padding: const EdgeInsets.all(AppPadding.p20),
        decoration: const BoxDecoration(
          color: ColorManager.babyBlue,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(AppSize.s20),
            topRight: Radius.circular(AppSize.s20),
          ),
        ),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.transparent,
          body: Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: const AddPostViewBody()),
        ),
      ),
    );
  }
}
