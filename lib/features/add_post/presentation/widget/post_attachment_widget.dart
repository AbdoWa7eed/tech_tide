import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tech_tide/core/res/color_manager.dart';
import 'package:tech_tide/core/res/values_manager.dart';
import 'package:tech_tide/features/add_post/presentation/cubit/add_post_cubit.dart';
import 'package:tech_tide/features/add_post/presentation/widget/attached_image_widget.dart';

class PostAttachmentWidget extends StatelessWidget {
  const PostAttachmentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddPostCubit, AddPostState>(
      builder: (context, state) {
        final cubit = context.read<AddPostCubit>();
        return Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: Wrap(
                  runSpacing: AppSize.s8,
                  spacing: AppSize.s8,
                  children: List.generate(
                    cubit.attachedImages.length,
                    (index) =>
                        AttachedImageWidget(file: cubit.attachedImages[index]),
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(
                  Icons.attach_file_outlined,
                  color: ColorManager.gray,
                ),
                onPressed: () {
                  cubit.pickImage();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
