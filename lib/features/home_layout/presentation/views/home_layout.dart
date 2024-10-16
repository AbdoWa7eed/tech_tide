import 'package:flutter/material.dart';
import 'package:tech_tide/features/home_layout/presentation/widgets/custom_nav_bar.dart';
import 'package:tech_tide/features/home_layout/presentation/widgets/home_layout_body.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const HomeLayoutBody(),
      bottomNavigationBar: CustomNavBarWidget(),
    );
  }
}
