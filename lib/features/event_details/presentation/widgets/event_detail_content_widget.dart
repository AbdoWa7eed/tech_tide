import 'package:flutter/material.dart';

import '../../../../core/res/styles_manager.dart';
class EventDetailContentWidget extends StatelessWidget {
  const EventDetailContentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: const Text(
          """ Lorem Ipsum is simply dummy text of the printing and typesetting industry.
Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, 
when an unknown printer took a galley of type and scrambled it to make a type specimen book."""
      ,style: StylesManager.medium16Gray
      ),
    );
  }
}
