import 'package:flutter/material.dart';
import 'package:tech_tide/core/res/color_manager.dart';
import 'package:tech_tide/core/res/values_manager.dart';
import 'package:tech_tide/core/widgets/custom_readmore_text.dart';
import 'package:tech_tide/core/widgets/post/like_post_button.dart';
import 'package:tech_tide/core/widgets/post/post_header_widget.dart';

class PostReplyWidget extends StatelessWidget {
  const PostReplyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Card(
      color: ColorManager.white,
      elevation: AppSize.s2,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: AppPadding.p12, vertical: AppPadding.p12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PostHeaderWidget(
              title: "Mohammed",
              subTitle: "1h ago",
              imageUrl: 'https://i.pravatar.cc/300',
              isCanBeSaved: false,
            ),
            SizedBox(
              height: AppSize.s12,
            ),
            CustomReadmoreText(
              text:
                  "orem Ipsum is simply dummy text of the printing and typesetting industry."
                  " It has survived not only five centuries, but also the leap into electronic typesetting"
                  ", remaining essentially unchanged."
                  " It was popularised in the 1960s with the release of Latest sheets containing Lorem Ipsum passages, "
                  "and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum",
            ),
            LikePostButton()
          ],
        ),
      ),
    );
  }
}
