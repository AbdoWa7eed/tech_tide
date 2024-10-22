import 'package:flutter/material.dart';
import 'package:tech_tide/features/event_details/presentation/widgets/event_detail_content_widget.dart';
import 'package:tech_tide/features/event_details/presentation/widgets/event_details_attendees_widget.dart';
import 'package:tech_tide/features/event_details/presentation/widgets/event_details_header_widget.dart';
import 'package:tech_tide/features/event_details/presentation/widgets/event_details_image_widget.dart';
import 'package:tech_tide/features/event_details/presentation/widgets/event_details_info_widget.dart';
import 'package:tech_tide/features/event_details/presentation/widgets/event_details_place_widget.dart';

import '../../../../core/res/color_manager.dart';
import '../../../../core/res/values_manager.dart';

class EventDetailsView extends StatelessWidget {
  const EventDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return const Scaffold(
      backgroundColor: ColorManager.babyBlue, // Update this to match background color
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(AppPadding.p20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header (with close button, title, etc.)
              EventDetailsHeaderWidget(),
              SizedBox(height: AppSize.s20),

              // Image widget (representing the event image)
              EventDetailsImageWidget(
                imageUrl: "https://www.shutterstock.com/image-photo/mountains-under-mist-morning-amazing-260nw-1725825019.jpg",
              ),
              SizedBox(height: AppSize.s20),

              // Event Information (date, time, location, favorite icon)
              EventDetailsInfoWidget(),
              SizedBox(height: AppSize.s20),

              // Event content (description)
              EventDetailContentWidget(),
              SizedBox(height: AppSize.s20),

              // Place (location details)
              EventDetailsPlaceWidget(),
              SizedBox(height: AppSize.s30),

              // Attendees list (avatars and additional attendees count)
              AttendeesWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
