import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tech_tide/core/widgets/empty_widget.dart';
import 'package:tech_tide/core/widgets/error_view.dart';
import 'package:tech_tide/features/home/presentation/cubit/home_cubit.dart';
import 'package:tech_tide/features/home/presentation/widgets/home_header_widget.dart';
import 'package:tech_tide/features/home/presentation/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
      ),
    );

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: CustomScrollView(
        slivers: [
          const HomeHeaderWidget(),
          BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              if (state is HomeLoading || state is HomeInitial) {
                return const SliverFillRemaining(
                  hasScrollBody: false,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }
              if (state is HomeError) {
                return SliverFillRemaining(
                    hasScrollBody: false,
                    child: ErrorViewWidget(error: state.message));
              }
              final currentState = state as HomeLoaded;
              if (currentState.trendingPosts.isEmpty &&
                  currentState.popularTopics.isEmpty) {
                return const SliverFillRemaining(
                    hasScrollBody: false, child: EmptyViewWidget());
              }
              return const SliverToBoxAdapter(child: HomeViewBody());
            },
          ),
        ],
      ),
    );
  }
}
