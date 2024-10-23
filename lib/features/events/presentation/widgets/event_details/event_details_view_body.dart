import 'package:flutter/material.dart';
import 'package:tech_tide/core/res/values_manager.dart';
import 'package:tech_tide/core/widgets/custom_readmore_text.dart';
import 'package:tech_tide/features/events/domain/entities/event_entity.dart';
import 'package:tech_tide/features/events/presentation/widgets/event_details/event_details_attendees_widget.dart';
import 'package:tech_tide/features/events/presentation/widgets/event_details/event_details_image_widget.dart';
import 'package:tech_tide/features/events/presentation/widgets/event_details/event_details_info_widget.dart';
import 'package:tech_tide/features/events/presentation/widgets/event_details/event_details_place_widget.dart';

class EventDetailsViewBody extends StatelessWidget {
  const EventDetailsViewBody({super.key, required this.event});

  final EventEntity event;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(AppPadding.p20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            EventDetailsImageWidget(
              imageUrl: event.imageUrl,
            ),
            const SizedBox(height: AppSize.s20),
            EventDetailsInfoWidget(
              event: event,
            ),
            const SizedBox(height: AppSize.s20),
            CustomReadmoreText(
              trimLines: 4,
              text: event.description,
            ),
            const SizedBox(height: AppSize.s20),
            EventDetailsPlaceWidget(
              address: event.address,
            ),
            const SizedBox(height: AppSize.s30),
            AttendeesWidget(users: event.goingUsers),
          ],
        ),
      ),
    );
  }
}
