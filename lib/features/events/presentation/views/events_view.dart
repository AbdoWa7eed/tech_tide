import 'package:flutter/material.dart';

import '../../../../core/widgets/gradiant_app_bar.dart';
import '../widgets/card_view.dart';

class EventsView extends StatelessWidget {
  const EventsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(title: 'Events'),
      body: ListView(
        children: [
          EventCard(),
          EventCard(),
        ],
      ),
    );

  }
}
