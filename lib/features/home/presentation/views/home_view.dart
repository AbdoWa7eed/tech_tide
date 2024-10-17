import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

    return const Scaffold(
      backgroundColor: Colors.transparent,
      body: CustomScrollView(
        slivers: [
          HomeHeaderWidget(),
          SliverToBoxAdapter(
            child: HomeViewBody(),
          ),
        ],
      ),
    );
  }
}
