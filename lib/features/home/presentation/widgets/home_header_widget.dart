import 'package:flutter/material.dart';
import 'package:tech_tide/core/res/color_manager.dart';
import 'package:tech_tide/core/res/strings_manager.dart';
import 'package:tech_tide/core/res/styles_manager.dart';
import 'package:tech_tide/features/home/presentation/widgets/header_info_widget.dart';

class HomeHeaderWidget extends StatelessWidget {
  const HomeHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return SliverAppBar(
      expandedHeight: height * 0.25,
      floating: false,
      elevation: 2,
      shadowColor: ColorManager.lightGray,
      pinned: true,
      backgroundColor: Colors.transparent,
      flexibleSpace: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          var top = constraints.biggest.height;
          bool isCollapsed = top <= kToolbarHeight + 50;

          return Stack(
            fit: StackFit.expand,
            children: [
              const DecoratedBox(
                  decoration: BoxDecoration(
                gradient: ColorManager.gradientColor,
              )),
              FlexibleSpaceBar(
                centerTitle: true,
                title: isCollapsed
                    ? const Text(
                        AppStrings.appTitle,
                        style: StylesManager.semiBold30,
                      )
                    : null,
                background: const HeaderInfoWidget(),
              ),
            ],
          );
        },
      ),
    );
  }
}
