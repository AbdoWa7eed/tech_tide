import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tech_tide/core/res/styles_manager.dart';

import '../../../../core/routes/routes_manager.dart';

class EventCard extends StatefulWidget {
  const EventCard({super.key});

  @override
  State<EventCard> createState() => _EventCardState();
}

class _EventCardState extends State<EventCard> {
  bool isFavourite = false;
  Icon starIcon = const Icon(Icons.star_outline_rounded);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 21, right: 21, top: 21),
      child: SizedBox(
        height: 250,
        child: GestureDetector(
          onTap: (){context.pushReplacement(Routes.eventDetailsRoute);},
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(15.0),
                  ),
                  child: Image.network(
                    "https://i.pravatar.cc/550", // Corrected the URL format
                    width: double.infinity,
                    height: 160,
                    fit: BoxFit.cover,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Date Column
                        const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Sep',
                              style: StylesManager.medium22,
                            ),
                            Text(
                              '24',
                              style: StylesManager.medium22,
                            ),
                          ],
                        ),
                        const SizedBox(width: 16.0), // Spacing between the date and text
                        // Title and Subtitle Column
                        const Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Flutter Community',
                                style: StylesManager.medium18,
                              ),
                              Text(
                                '4 people going',
                                style: StylesManager.regular12,
                              ),
                            ],
                          ),
                        ),
                        // Star Icon Button
                        IconButton(
                          icon: starIcon,
                          onPressed: () {
                            setState(() {
                              starIcon = starIcon.icon == Icons.star_outline_rounded
                                  ? const Icon(Icons.star, color: Colors.orange)
                                  : const Icon(Icons.star_outline_rounded);
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
