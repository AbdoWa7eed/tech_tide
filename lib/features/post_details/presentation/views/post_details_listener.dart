import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tech_tide/core/widgets/custom_snack_bar.dart';
import 'package:tech_tide/features/post_details/presentation/cubit/post_details_cubit.dart';

class PostDetailsListener extends StatelessWidget {
  const PostDetailsListener({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocListener<PostDetailsCubit, PostDetailsState>(
      listener: (context, state) {
        if (state is AddReplyError) {
          CustomSnackBar.error(state.message, context);
        }
        if (state is ToggleLikeReplyError) {
          CustomSnackBar.error(state.message, context);
        }
      },
      child: child,
    );
  }
}
