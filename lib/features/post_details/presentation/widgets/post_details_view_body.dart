import 'package:flutter/material.dart';
import 'package:tech_tide/core/res/values_manager.dart';
import 'package:tech_tide/features/post_details/presentation/widgets/add_reply_form_field.dart';
import 'package:tech_tide/features/post_details/presentation/widgets/post_details_widget.dart';
import 'package:tech_tide/features/post_details/presentation/widgets/post_replies_widget.dart';

class PostDetailsViewBody extends StatelessWidget {
  const PostDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: AppPadding.p18, vertical: AppPadding.p18),
              child: Column(
                children: [
                  PostDetailsWidget(),
                  SizedBox(height: AppSize.s12),
                  PostRepliesWidget()
                ],
              ),
            )),
        AddReplyFormField(),
      ],
    );
  }
}
