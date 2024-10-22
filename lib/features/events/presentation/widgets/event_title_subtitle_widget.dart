import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tech_tide/core/res/strings_manager.dart';
import 'package:tech_tide/core/res/styles_manager.dart';
import 'package:tech_tide/features/events/domain/entities/event_entity.dart';

class EventTitleSubtitle extends StatelessWidget {
  const EventTitleSubtitle({super.key, required this.event});
  final EventEntity event;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          event.title,
          style: StylesManager.medium18Black,
        ),
        Text(
          AppStrings.peopleGoing.tr(args: [event.goingUsers.length.toString()]),
          style: StylesManager.regular12,
        ),
      ],
    );
  }
}
