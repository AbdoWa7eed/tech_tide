import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tech_tide/core/res/assets_manager.dart';
import 'package:tech_tide/core/res/color_manager.dart';
import 'package:tech_tide/core/res/values_manager.dart';
import 'package:tech_tide/features/add_post/presentation/cubit/add_post_cubit.dart';

class AddPostButtonWidget extends StatelessWidget {
  const AddPostButtonWidget({super.key, this.onPressed});

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.bottomEnd,
      child: FloatingActionButton(
        onPressed: onPressed,
        backgroundColor: ColorManager.primary,
        shape: const CircleBorder(),
        child: BlocBuilder<AddPostCubit, AddPostState>(
          builder: (context, state) {
            if (state is AddPostLoading) {
              return const SizedBox(
                width: AppSize.s24,
                height: AppSize.s24,
                child: CircularProgressIndicator(color: ColorManager.white),
              );
            }
            return SvgPicture.asset(AssetsManager.sendIcon);
          },
        ),
      ),
    );
  }
}
