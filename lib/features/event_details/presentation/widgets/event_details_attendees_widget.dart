import 'package:flutter/material.dart';
import 'package:tech_tide/core/res/styles_manager.dart';

class AttendeesWidget extends StatelessWidget {
  const AttendeesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // "Going" text
        const Text(
          'Going',
          style: StylesManager.semiBold18Black
        ),
        const SizedBox(height: 8), // Add spacing between title and avatars

        // Attendees Row
        Row(
          children: [
            // List of avatars
            for (int i = 0; i < 3; i++)
              const Padding(
                padding: EdgeInsets.only(right: 4.0),
                child: CircleAvatar(
                  radius: 22,
                  backgroundImage: NetworkImage(
                    'https://randomuser.me/api/portraits/men/1.jpg', // Example profile image
                  ),
                ),
              ),
            // "+10" Circle
            const CircleAvatar(
              radius: 22,
              backgroundColor: Colors.blue,
              child: Text(
                '+10',
                style: StylesManager.semiBold16
                ),
              ),
          ],
        ),
      ],
    );
  }
}