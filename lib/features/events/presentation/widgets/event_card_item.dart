import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tech_tide/core/res/color_manager.dart';
import 'package:tech_tide/core/res/values_manager.dart';
import 'package:tech_tide/core/routes/routes_manager.dart';
import 'package:tech_tide/features/events/presentation/widgets/event_date_widget.dart';
import 'package:tech_tide/features/events/presentation/widgets/event_favorite_button.dart';
import 'package:tech_tide/features/events/presentation/widgets/event_image_widget.dart';
import 'package:tech_tide/features/events/presentation/widgets/event_title_subtitle_widget.dart';

class EventCardItem extends StatefulWidget {
  const EventCardItem({super.key});

  @override
  State<EventCardItem> createState() => _EventCardItemState();
}

class _EventCardItemState extends State<EventCardItem> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSize.s250,
      child: GestureDetector(
        onTap: () {
          context.push(Routes.eventDetailsRoute);
        },
        child: Card(
          elevation: 2,
          shadowColor: ColorManager.lightGray,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSize.s16),
          ),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              EventImageWidget(),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(AppPadding.p8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      EventDate(),
                      SizedBox(width: AppSize.s12),
                      Expanded(
                        child: EventTitleSubtitle(),
                      ),
                      FavoriteButton(
                        isFavorite: false,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
