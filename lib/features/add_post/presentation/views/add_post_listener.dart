import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tech_tide/core/widgets/custom_snack_bar.dart';
import 'package:tech_tide/features/add_post/presentation/cubit/add_post_cubit.dart';

class AddPostListenerWidget extends StatelessWidget {
  final Widget child;

  const AddPostListenerWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddPostCubit, AddPostState>(
      listener: (context, state) {
        if (state is AddPostSuccess) {
          context.pop();
        } else if (state is AddPostError) {
          CustomSnackBar.error(state.message, context);
        }
      },
      child: child,
    );
  }
}
