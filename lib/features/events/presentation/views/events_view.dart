import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tech_tide/core/res/strings_manager.dart';
import 'package:tech_tide/core/utils/extensions.dart';
import 'package:tech_tide/core/widgets/error_view.dart';
import 'package:tech_tide/core/widgets/gradiant_app_bar.dart';
import 'package:tech_tide/features/events/presentation/cubit/events_cubit.dart';
import 'package:tech_tide/features/events/presentation/widgets/events_view_body.dart';

class EventsView extends StatelessWidget {
  const EventsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(title: AppStrings.events.translate),
      body: BlocBuilder<EventsCubit, EventsState>(
        builder: (context, state) {
          if (state is EventsInitial || state is EventsLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is EventsError) {
            return ErrorViewWidget(
              error: state.message,
              onTryAgain: () => context.read<EventsCubit>().getEvents(),
            );
          }
          return const EventsViewBody();
        },
      ),
    );
  }
}
