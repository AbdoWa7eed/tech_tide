import 'package:flutter/material.dart';
import 'package:tech_tide/core/res/strings_manager.dart';
import 'package:tech_tide/core/utils/extensions.dart';
import 'package:tech_tide/core/widgets/gradiant_app_bar.dart';
import 'package:tech_tide/features/post_details/widgets/post_details_view_body.dart';

class PostDetailsView extends StatelessWidget {
  const PostDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: GradientAppBar(title: AppStrings.postDetails.translate),
        body: const PostDetailsViewBody());
  }
}
