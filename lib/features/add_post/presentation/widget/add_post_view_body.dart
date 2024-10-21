import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tech_tide/core/res/values_manager.dart';
import 'package:tech_tide/features/add_post/presentation/cubit/add_post_cubit.dart';
import 'package:tech_tide/features/add_post/presentation/widget/add_post_button.dart';
import 'package:tech_tide/features/add_post/presentation/widget/add_post_header_widget.dart';
import 'package:tech_tide/features/add_post/presentation/widget/add_post_title_widget.dart';
import 'package:tech_tide/features/add_post/presentation/widget/content_input_widget.dart';
import 'package:tech_tide/features/add_post/presentation/widget/tags_input_widget.dart';

class AddPostViewBody extends StatefulWidget {
  const AddPostViewBody({super.key});

  @override
  State<AddPostViewBody> createState() => _AddPostViewBodyState();
}

class _AddPostViewBodyState extends State<AddPostViewBody> {
  late final TextEditingController _titleController;
  late final TextEditingController _contentController;
  late final GlobalKey<FormState> _formKey;

  @override
  void initState() {
    _titleController = TextEditingController();
    _contentController = TextEditingController();
    _formKey = GlobalKey<FormState>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                const AddPostHeaderWidget(),
                const SizedBox(height: AppSize.s20),
                AddPostTitleWidget(titleController: _titleController),
                const SizedBox(height: AppSize.s20),
                ContentInputWidget(contentController: _contentController),
                const SizedBox(height: AppSize.s20),
                const TagsInputWidget(),
              ],
            ),
          ),
          AddPostButtonWidget(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                context.read<AddPostCubit>().addPost(
                      title: _titleController.text.trim(),
                      content: _contentController.text.trim(),
                    );
              }
            },
          ),
        ],
      ),
    );
  }
}
