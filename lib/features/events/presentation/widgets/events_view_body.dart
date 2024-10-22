import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tech_tide/core/res/values_manager.dart';
import 'package:tech_tide/core/widgets/empty_widget.dart';
import 'package:tech_tide/features/events/presentation/cubit/events_cubit.dart';
import 'package:tech_tide/features/events/presentation/widgets/event_card_item.dart';

class EventsViewBody extends StatelessWidget {
  const EventsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EventsCubit, EventsState>(
      builder: (context, state) {
        final cubit = context.read<EventsCubit>();
        if (cubit.events.isEmpty) {
          return EmptyViewWidget(onTryAgain: () => cubit.getEvents());
        }
        return RefreshIndicator(
          displacement: 1,
          onRefresh: () async => cubit.getEvents(),
          child: ListView.separated(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(
                horizontal: AppPadding.p20, vertical: AppPadding.p18),
            itemBuilder: (context, index) {
              return EventCardItem(event: cubit.events[index]);
            },
            separatorBuilder: (context, index) => const SizedBox(
              height: AppSize.s20,
            ),
            itemCount: cubit.events.length,
          ),
        );
      },
    );
  }
}
