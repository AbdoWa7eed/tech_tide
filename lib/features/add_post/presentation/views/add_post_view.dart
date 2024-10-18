import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tech_tide/core/res/color_manager.dart';
import 'package:tech_tide/core/res/values_manager.dart';
import 'package:tech_tide/features/add_post/presentation/cubit/add_post_cubit.dart';
import 'package:tech_tide/features/add_post/presentation/widget/add_post_view_body.dart';

class AddPostView extends StatelessWidget {
  const AddPostView({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return BlocProvider<AddPostCubit>(
      create: (context) => AddPostCubit(),
      child: Container(
        height: height * 0.95,
        padding: const EdgeInsets.all(AppPadding.p20),
        decoration: const BoxDecoration(
          color: ColorManager.babyBlue,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(AppSize.s20),
            topRight: Radius.circular(AppSize.s20),
          ),
        ),
        child: Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: const AddPostViewBody()),
      ),
    );
  }
}
