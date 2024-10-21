import 'package:flutter/material.dart';
import 'package:tech_tide/core/res/values_manager.dart';

// Separate Widget for Event Image
class EventImageWidget extends StatelessWidget {
  const EventImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius:
          const BorderRadius.vertical(top: Radius.circular(AppSize.s16)),
      child: Image.network(
        "https://i.pravatar.cc/550",
        width: double.infinity,
        height: AppSize.s160,
        fit: BoxFit.cover,
      ),
    );
  }
}
