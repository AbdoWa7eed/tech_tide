import 'package:flutter/material.dart';
import 'package:tech_tide/core/res/strings_manager.dart';
import 'package:tech_tide/core/res/styles_manager.dart';
import 'package:tech_tide/core/utils/extensions.dart';

class EventDetailsPlaceWidget extends StatelessWidget {
  const EventDetailsPlaceWidget({super.key, required this.address});
  final String address;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.place.translate,
          style: StylesManager.semiBold16Black,
        ),
        Text(
          address,
          style: StylesManager.medium14Gray,
        )
      ],
    );
  }
}
