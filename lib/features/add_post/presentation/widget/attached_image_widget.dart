import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tech_tide/core/res/color_manager.dart';
import 'package:tech_tide/core/res/values_manager.dart';
import 'package:tech_tide/features/add_post/presentation/cubit/add_post_cubit.dart';

class AttachedImageWidget extends StatelessWidget {
  const AttachedImageWidget({super.key, required this.file});

  final File file;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSize.s80 + AppSize.s8,
      width: AppSize.s80 + AppSize.s8,
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            child: Container(
              height: AppSize.s80,
              width: AppSize.s80,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppSize.s12),
                color: ColorManager.primaryWith10Opacity,
              ),
              child: Image.file(
                fit: BoxFit.cover,
                file,
              ),
            ),
          ),
          Positioned(
            right: 0,
            top: 0,
            child: GestureDetector(
              onTap: () {
                context.read<AddPostCubit>().removeImage(file);
              },
              child: const CircleAvatar(
                radius: AppSize.s10,
                backgroundColor: ColorManager.deepTeal,
                child: Icon(
                  Icons.close,
                  color: ColorManager.white,
                  size: AppSize.s20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
