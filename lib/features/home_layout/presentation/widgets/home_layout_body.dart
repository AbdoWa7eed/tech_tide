import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tech_tide/core/res/color_manager.dart';
import 'package:tech_tide/features/home/presentation/views/home_view.dart';
import 'package:tech_tide/features/home_layout/presentation/provider/layout_controller.dart';

import '../../../events/presentation/views/events_view.dart';

class HomeLayoutBody extends StatefulWidget {
  const HomeLayoutBody({super.key});

  @override
  State<HomeLayoutBody> createState() => _HomeLayoutBodyState();
}

class _HomeLayoutBodyState extends State<HomeLayoutBody> {
  @override
  Widget build(BuildContext context) {
    return Consumer<LayoutController>(
      builder: (context, provider, child) {
        return PageView(
          controller: provider.pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: const [
            //Add Home View
            HomeView(),
            //Add Event View
            EventsView(),
            //Opens "Add Post" BottomSheet
            SizedBox.shrink(),
            //Add Chats View
            Placeholder(color: ColorManager.error),
            //Add Profile View
            Placeholder(),
          ],
        );
      },
    );
  }
}
