import 'package:flutter/material.dart';
import 'package:tech_tide/core/res/values_manager.dart';
import 'package:tech_tide/features/events/presentation/widgets/event_card_item.dart';

class EventsViewBody extends StatelessWidget {
  const EventsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(
          horizontal: AppPadding.p20, vertical: AppPadding.p18),
      itemBuilder: (context, index) {
        return const EventCardItem();
      },
      separatorBuilder: (context, index) => const SizedBox(
        height: AppSize.s20,
      ),
      itemCount: 5,
    );
  }
}
