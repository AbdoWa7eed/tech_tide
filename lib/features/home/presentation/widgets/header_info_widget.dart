import 'package:flutter/material.dart';
import 'package:tech_tide/core/res/styles_manager.dart';
import 'package:tech_tide/core/res/values_manager.dart';

class HeaderInfoWidget extends StatelessWidget {
  const HeaderInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
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
                  Text("Hi Mohammed", style: StylesManager.semiBold30),
                  Text(
                    "Find topics that you like to read",
                    style: StylesManager.medium16,
                  ),
                ],
              ),
            ),
            CircleAvatar(
              radius: AppSize.s20,
              backgroundImage: NetworkImage("https://i.pravatar.cc/200"),
            ),
          ],
        ),
      ),
    );
  }
}
