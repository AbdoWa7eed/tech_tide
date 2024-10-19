import 'package:flutter/material.dart';
import 'package:tech_tide/core/res/styles_manager.dart';
import 'package:tech_tide/core/res/values_manager.dart';
import 'package:tech_tide/core/widgets/circled_network_image.dart';

class ReplyHeaderWidget extends StatelessWidget {
  const ReplyHeaderWidget(
      {super.key,
      required this.imageUrl,
      required this.title,
      required this.subTitle});

  final String imageUrl;
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      CircledNetworkImage(
        imageUrl: imageUrl,
      ),
      const SizedBox(width: AppSize.s12),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: StylesManager.medium14,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              subTitle,
              style: StylesManager.regular12,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      )
    ]);
  }
}
