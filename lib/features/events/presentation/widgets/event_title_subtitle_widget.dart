import 'package:flutter/material.dart';
import 'package:tech_tide/core/res/styles_manager.dart';

class EventTitleSubtitle extends StatelessWidget {
  const EventTitleSubtitle({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Flutter Community',
          style: StylesManager.medium20,
        ),
        Text(
          '4 people going',
          style: StylesManager.regular12,
        ),
      ],
    );
  }
}
