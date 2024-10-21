import 'package:flutter/material.dart';
import 'package:tech_tide/core/res/styles_manager.dart';

class EventDate extends StatelessWidget {
  const EventDate({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Sep',
          style: StylesManager.medium20,
        ),
        Text(
          '24',
          style: StylesManager.medium20,
        ),
      ],
    );
  }
}
