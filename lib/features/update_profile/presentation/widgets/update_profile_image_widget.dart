import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tech_tide/core/res/assets_manager.dart';
import 'package:tech_tide/core/res/color_manager.dart';
import 'package:tech_tide/core/res/values_manager.dart';
import 'package:tech_tide/core/widgets/circled_network_image.dart';
import 'package:tech_tide/features/update_profile/presentation/cubit/update_profile_cubit.dart';

class UpdateProfileImageWidget extends StatelessWidget {
  const UpdateProfileImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomEnd,
      children: [
        BlocBuilder<UpdateProfileCubit, UpdateProfileState>(
          builder: (context, state) {
            final cubit = context.read<UpdateProfileCubit>();
            if (cubit.profileImage != null) {
              return CircleAvatar(
                radius: AppSize.s65,
                foregroundImage: FileImage(cubit.profileImage!),
              );
            }
            return CircledNetworkImage(
              imageUrl: cubit.user.imageUrl,
              radius: AppSize.s65,
            );
          },
        ),
        GestureDetector(
          onTap: () => context.read<UpdateProfileCubit>().pickImage(),
          child: CircleAvatar(
            radius: AppSize.s20,
            backgroundColor: ColorManager.paleBlue,
            child: SvgPicture.asset(AssetsManager.editIcon),
          ),
        ),
      ],
    );
  }
}
