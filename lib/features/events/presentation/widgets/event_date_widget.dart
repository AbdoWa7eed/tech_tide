import 'package:flutter/material.dart';
import 'package:tech_tide/core/res/styles_manager.dart';
import 'package:tech_tide/core/utils/extensions.dart';

class EventDate extends StatelessWidget {
  const EventDate({super.key, required this.dateTime});

  final DateTime dateTime;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          dateTime.formattedDay,
          style: StylesManager.medium18Black,
        ),
        Text(
          dateTime.formattedMonth,
          style: StylesManager.medium18Black,
        ),
      ],
    );
  }
}
