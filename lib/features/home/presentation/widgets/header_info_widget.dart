import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tech_tide/core/res/strings_manager.dart';
import 'package:tech_tide/core/res/styles_manager.dart';
import 'package:tech_tide/core/res/values_manager.dart';
import 'package:tech_tide/core/routes/routes_manager.dart';
import 'package:tech_tide/core/utils/extensions.dart';
import 'package:tech_tide/core/widgets/circled_network_image.dart';
import 'package:tech_tide/features/home_layout/presentation/cubit/layout_cubit.dart';

class HeaderInfoWidget extends StatelessWidget {
  const HeaderInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final user = context.read<LayoutCubit>().user;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p20),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("${AppStrings.hi.translate} ${user.username}",
                      style: StylesManager.semiBold30),
                  Text(
                    AppStrings.homeSubtitle.translate,
                    style: StylesManager.medium16,
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                //TODO: ADD NAVIGATION TO PROFILE SCREEN
                //JUST A TEST FOR UPDATE PROFILE
                context.push(Routes.updateProfile);
              },
              child: CircledNetworkImage(
                imageUrl: user.imageUrl,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
