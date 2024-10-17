import 'package:flutter/material.dart';
import 'package:tech_tide/core/res/color_manager.dart';
import 'package:tech_tide/core/res/strings_manager.dart';
import 'package:tech_tide/core/res/styles_manager.dart';
import 'package:tech_tide/core/res/values_manager.dart';

class HomeHeaderWidget extends StatelessWidget {
  const HomeHeaderWidget({
    super.key,
  });

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
              Container(
                decoration: const BoxDecoration(
                  gradient: ColorManager.gradientColor,
                ),
              ),
              FlexibleSpaceBar(
                centerTitle: true,
                title: isCollapsed
                    ? const Text(
                        AppStrings.appTitle,
                        style: StylesManager.semiBold30,
                      )
                    : null,
                background: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppPadding.p20),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Hi Mohammed",
                                  style: StylesManager.semiBold30),
                              Text(
                                "Find topics that you like to read",
                                style: StylesManager.medium16,
                              ),
                            ],
                          ),
                        ),
                        CircleAvatar(
                          radius: AppSize.s20,
                          backgroundImage: NetworkImage(
                            "https://www.pngitem.com/pimgs/m/146-1468479_my-profile-icon-blank-profile-picture-circle-hd.png",
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
