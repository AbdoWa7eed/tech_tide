import 'package:flutter/material.dart';
import 'package:tech_tide/core/res/styles_manager.dart';
import 'package:tech_tide/core/res/values_manager.dart';
import 'package:tech_tide/core/widgets/custom_readmore_text.dart';

class PostContentWidget extends StatelessWidget {
  const PostContentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "C++ in a nutshell",
          style: StylesManager.semiBold18Black,
        ),
        SizedBox(height: AppSize.s8),
        CustomReadmoreText(
          text:
              "orem Ipsum is simply dummy text of the printing and typesetting industry."
              " It has survived not only five centuries, but also the leap into electronic typesetting"
              ", remaining essentially unchanged."
              " It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, "
              "and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum",
        ),
      ],
    );
  }
}
