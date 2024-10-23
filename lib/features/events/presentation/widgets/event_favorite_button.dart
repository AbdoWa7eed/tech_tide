import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tech_tide/core/res/color_manager.dart';
import 'package:tech_tide/core/res/strings_manager.dart';
import 'package:tech_tide/core/res/values_manager.dart';
import 'package:tech_tide/core/utils/extensions.dart';
import 'package:tech_tide/core/widgets/custom_snack_bar.dart';
import 'package:tech_tide/features/events/domain/entities/event_entity.dart';
import 'package:tech_tide/features/events/presentation/cubit/events_cubit.dart';
import 'package:tech_tide/features/home_layout/presentation/cubit/layout_cubit.dart';

class FavoriteButton extends StatelessWidget {
  const FavoriteButton({super.key, required this.event});

  final EventEntity event;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EventsCubit, EventsState>(
      listener: (context, state) {
        if (state is ToggleEventGoingStatusSuccess) {
          CustomSnackBar.success(
              state.isGoing
                  ? AppStrings.eventMarkedInterested.translate
                  : AppStrings.eventMarkedNotInterested.translate,
              context);
        }
        if (state is ToggleEventGoingStatusError) {
          CustomSnackBar.error(state.message, context);
        }
      },
      builder: (context, state) {
        final user = context.read<LayoutCubit>().user;
        final isFavorite = event.goingUsers
            .any((eventUser) => eventUser.userId == user.userId);
        return IconButton(
          icon: Icon(
            isFavorite ? Icons.star_rate_rounded : Icons.star_border_rounded,
            size: AppSize.s24,
            fill: isFavorite ? 1 : null,
            color: isFavorite ? ColorManager.deepTeal : Colors.grey,
          ),
          onPressed: () {
            context.read<EventsCubit>().toggleEventGoingStatus(
                  event.eventId,
                  user,
                );
          },
        );
      },
    );
  }
}
