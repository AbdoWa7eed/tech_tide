import 'package:flutter/material.dart';
import 'package:tech_tide/core/res/styles_manager.dart';
import 'package:tech_tide/core/res/values_manager.dart';
import 'package:tech_tide/features/events/domain/entities/event_entity.dart';
import 'package:tech_tide/features/events/presentation/widgets/event_favorite_button.dart';

class EventDetailsInfoWidget extends StatelessWidget {
  const EventDetailsInfoWidget({super.key, required this.event});

  final EventEntity event;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(event.formattedDateTime, style: StylesManager.medium18Black),
            const SizedBox(height: AppSize.s4),
            Text(event.governorate, style: StylesManager.semiBold16Black),
          ],
        ),
        FavoriteButton(event: event),
      ],
    );
  }
}
