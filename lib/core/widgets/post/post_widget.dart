import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tech_tide/core/res/color_manager.dart';
import 'package:tech_tide/core/res/values_manager.dart';
import 'package:tech_tide/core/routes/routes_manager.dart';
import 'package:tech_tide/core/widgets/post/post_action_buttons.dart';
import 'package:tech_tide/core/widgets/post/post_header_widget.dart';

class PostWidget extends StatelessWidget {
  const PostWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(Routes.postDetailsRoute);
      },
      child: const Card(
        color: ColorManager.white,
        elevation: AppSize.s2,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppPadding.p12,
            vertical: AppPadding.p12,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PostHeaderWidget(
                title: 'C++ in a nutshell',
                imageUrl: 'https://i.pravatar.cc/300',
                subTitle: "Mohammed",
              ),
              SizedBox(height: AppSize.s16),
              Text(
                'So, i have been using c++ for a whole decade now,'
                ' if you guys know how to break the boring feeling of c++ into '
                'something more interesting, please let me know. '
                'I would love to learn more about it.',
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
              ),
              SizedBox(height: AppSize.s16),
              PostActionButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
