import 'package:flutter/material.dart';
import 'package:tech_tide/core/widgets/gradiant_app_bar.dart';
import 'package:tech_tide/features/events/domain/entities/event_entity.dart';
import 'package:tech_tide/features/events/presentation/widgets/event_details/event_details_view_body.dart';

class EventDetailsView extends StatelessWidget {
  const EventDetailsView({super.key, required this.event});
  final EventEntity event;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(title: event.title),
      body: EventDetailsViewBody(event: event),
    );
  }
}
