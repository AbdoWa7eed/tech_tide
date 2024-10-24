import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tech_tide/core/entities/user_entity.dart';
import 'package:tech_tide/core/res/strings_manager.dart';
import 'package:tech_tide/core/res/styles_manager.dart';
import 'package:tech_tide/core/res/values_manager.dart';
import 'package:tech_tide/core/utils/extensions.dart';
import 'package:tech_tide/core/widgets/circled_network_image.dart';
import 'package:tech_tide/features/events/presentation/cubit/events_cubit.dart';

class AttendeesWidget extends StatelessWidget {
  const AttendeesWidget({super.key, required this.users});

  final List<UserEntity> users;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EventsCubit, EventsState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(AppStrings.going.translate,
                style: StylesManager.semiBold16Black),
            const SizedBox(height: AppSize.s8),
            SizedBox(
              height: AppSize.s50,
              width: AppSize.s50,
              child: Row(
                children: [
                  ListView.separated(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: users.length <= 4 ? users.length : 4,
                    itemBuilder: (context, index) {
                      return CircledNetworkImage(
                        radius: AppSize.s22,
                        imageUrl: users[index].imageUrl,
                      );
                    },
                    separatorBuilder: (context, index) => const SizedBox(
                      width: AppSize.s8,
                    ),
                  ),
                  Visibility(
                    visible: !(users.length <= 4),
                    child: CircleAvatar(
                      radius: AppSize.s22,
                      backgroundColor: Colors.blue,
                      child: Text('${users.length - 4}',
                          style: StylesManager.semiBold16),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
