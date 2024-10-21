import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tech_tide/core/res/strings_manager.dart';
import 'package:tech_tide/core/utils/extensions.dart';
import 'package:tech_tide/core/widgets/error_view.dart';
import 'package:tech_tide/core/widgets/gradiant_app_bar.dart';
import 'package:tech_tide/features/post_details/presentation/cubit/post_details_cubit.dart';
import 'package:tech_tide/features/post_details/presentation/views/post_details_listener.dart';
import 'package:tech_tide/features/post_details/presentation/widgets/post_details_view_body.dart';

class PostDetailsView extends StatelessWidget {
  const PostDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return PostDetailsListener(
      child: Scaffold(
          appBar: GradientAppBar(title: AppStrings.postDetails.translate),
          body: BlocBuilder<PostDetailsCubit, PostDetailsState>(
            builder: (context, state) {
              if (state is PostDetailsLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is PostDetailsError) {
                return ErrorViewWidget(error: state.message);
              }
              return const PostDetailsViewBody();
            },
          )),
    );
  }
}
