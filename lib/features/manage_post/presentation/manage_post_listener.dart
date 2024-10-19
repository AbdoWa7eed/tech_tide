import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tech_tide/core/widgets/custom_snack_bar.dart';
import 'package:tech_tide/features/manage_post/presentation/cubit/manage_post_cubit.dart';

class ManagePostListener extends StatelessWidget {
  const ManagePostListener({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocListener<ManagePostCubit, ManagePostState>(
      listener: (context, state) {
        if (state is ManagePostError) {
          CustomSnackBar.error(state.message, context);
        }
      },
      child: child,
    );
  }
}
