import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tech_tide/core/res/strings_manager.dart';
import 'package:tech_tide/core/res/styles_manager.dart';
import 'package:tech_tide/core/res/values_manager.dart';
import 'package:tech_tide/core/utils/extensions.dart';
import 'package:tech_tide/core/widgets/custom_white_field.dart';
import 'package:tech_tide/features/add_post/presentation/cubit/add_post_cubit.dart';

class TagsInputWidget extends StatefulWidget {
  const TagsInputWidget({super.key});

  @override
  State<TagsInputWidget> createState() => _TagsInputWidgetState();
}

class _TagsInputWidgetState extends State<TagsInputWidget> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddPostCubit, AddPostState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppStrings.tags.translate,
              style: StylesManager.medium18,
            ),
            const SizedBox(height: AppSize.s12),
            GestureDetector(
              onTap: () {
                FocusScope.of(context).requestFocus(FocusNode());
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomWhiteTextField(
                    controller: _controller,
                    textInputAction: TextInputAction.done,
                    maxLines: 1,
                    hintText: AppStrings.addTags.translate,
                    onSubmit: (value) => _addTag(context),
                    suffix: IconButton(
                      onPressed: () => _addTag(context),
                      icon: const Icon(Icons.add),
                    ),
                  ),
                  const SizedBox(height: AppSize.s12),
                  Wrap(
                    children: context
                        .read<AddPostCubit>()
                        .tags
                        .map((tag) => Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: AppPadding.p4),
                              child: Chip(
                                label: Text(tag),
                                onDeleted: () => _removeTag(context, tag),
                              ),
                            ))
                        .toList(),
                  )
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  void _addTag(BuildContext context) {
    final tag = _controller.text.trim();
    context.read<AddPostCubit>().addTag(tag);
    _controller.clear();
  }

  void _removeTag(BuildContext context, String tag) {
    context.read<AddPostCubit>().removeTag(tag);
  }
}
