import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tech_tide/core/widgets/error_view.dart';
import 'package:tech_tide/core/widgets/gradiant_app_bar.dart';
import 'package:tech_tide/features/popular_topic/presentation/cubit/popular_topic_cubit.dart';
import 'package:tech_tide/features/popular_topic/presentation/widgets/popular_topic_view_body.dart';

class PopularTopicView extends StatelessWidget {
  const PopularTopicView({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<PopularTopicCubit>();
    return Scaffold(
      appBar: GradientAppBar(title: cubit.topic),
      body: BlocBuilder<PopularTopicCubit, PopularTopicState>(
        builder: (context, state) {
          if (state is PopularTopicInitial || state is PopularTopicLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is PopularTopicError) {
            return ErrorViewWidget(error: state.message);
          }

          return const PopularTopicViewBody();
        },
      ),
    );
  }
}
