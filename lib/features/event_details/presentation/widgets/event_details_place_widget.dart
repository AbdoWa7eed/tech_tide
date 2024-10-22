import 'package:flutter/material.dart';
import 'package:tech_tide/core/res/styles_manager.dart';

class EventDetailsPlaceWidget extends StatelessWidget {
  const EventDetailsPlaceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width : double.infinity,
          child: const Text('Place',style: StylesManager.semiBold18Black,)
        ),
        Container(
          width : double.infinity,
          child: const Text("Cairo University - Giza - Egypt",style: StylesManager.medium16Gray,)
        )
      ],
    );
  }
}
