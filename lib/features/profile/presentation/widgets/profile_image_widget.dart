import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:tech_tide/core/res/assets_manager.dart';
import 'package:tech_tide/core/res/color_manager.dart';
import 'package:tech_tide/core/res/values_manager.dart';
import 'package:tech_tide/core/routes/routes_manager.dart';
import 'package:tech_tide/core/widgets/circled_network_image.dart';

class ProfileImageWidget extends StatelessWidget {
  const ProfileImageWidget({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomEnd,
      children: [
        CircledNetworkImage(
          imageUrl: imageUrl,
          radius: AppSize.s40,
        ),
        GestureDetector(
          onTap: () {
            context.push(Routes.updateProfile);
          },
          child: CircleAvatar(
            radius: AppSize.s14,
            backgroundColor: ColorManager.paleBlue,
            child: SvgPicture.asset(
              AssetsManager.editIcon,
              height: AppSize.s20,
              width: AppSize.s20,
            ),
          ),
        ),
      ],
    );
  }
}
