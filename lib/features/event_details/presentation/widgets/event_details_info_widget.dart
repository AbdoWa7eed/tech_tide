import 'package:flutter/material.dart';

import '../../../../core/res/styles_manager.dart';

class EventDetailsInfoWidget extends StatelessWidget {
  const EventDetailsInfoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Date and Location Column
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Sep 24, 8:00 am - 2:00 pm',
              style: StylesManager.medium18Black
            ),
            SizedBox(height: 4),
            Text(
              'Cairo - Egypt',
              style: StylesManager.semiBold18Black
            ),
          ],
        ),
        // Favorite Icon
        IconButton(
          onPressed: () {
            // Handle favorite toggle
          },
          icon: const Icon(
            Icons.star_border,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}