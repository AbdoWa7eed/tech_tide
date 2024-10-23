import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tech_tide/core/widgets/error_view.dart';
import 'package:tech_tide/features/chats/presentation/views/chats_view.dart';
import 'package:tech_tide/features/home/presentation/views/home_view.dart';
import 'package:tech_tide/features/home_layout/presentation/cubit/layout_cubit.dart';
import 'package:tech_tide/features/manage_post/presentation/manage_post_listener.dart';
import 'package:tech_tide/features/profile/presentation/views/profile_view.dart';

import '../../../events/presentation/views/events_view.dart';

class HomeLayoutBody extends StatefulWidget {
  const HomeLayoutBody({super.key});

  @override
  State<HomeLayoutBody> createState() => _HomeLayoutBodyState();
}

class _HomeLayoutBodyState extends State<HomeLayoutBody> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LayoutCubit, LayoutState>(
      builder: (context, state) {
        if (state is LayoutInitial || state is LayoutLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is LayoutError) {
          return ErrorViewWidget(error: state.message);
        }
        final cubit = context.read<LayoutCubit>();
        log(cubit.user.username);
        return ManagePostListener(
          child: PageView(
            controller: cubit.pageController,
            physics: const NeverScrollableScrollPhysics(),
            children: const [
              //Add Home View
              HomeView(),
              //Add Event View
              EventsView(),
              //Opens "Add Post" BottomSheet
              SizedBox.shrink(),
              //Add Chats View
              ChatsView(),
              //Add Profile View
              ProfileView(),
            ],
          ),
        );
      },
    );
  }
}
