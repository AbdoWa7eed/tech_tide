import 'package:flutter/material.dart';
import 'package:tech_tide/core/res/strings_manager.dart';
import 'package:tech_tide/core/utils/extensions.dart';
import 'package:tech_tide/core/widgets/gradiant_app_bar.dart';
import 'package:tech_tide/features/events/presentation/widgets/events_view_body.dart';

class EventsView extends StatelessWidget {
  const EventsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(title: AppStrings.events.translate),
      body: const EventsViewBody(),
    );
  }
}
