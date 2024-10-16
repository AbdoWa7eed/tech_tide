import 'package:flutter/material.dart';
import 'package:tech_tide/core/res/assets_manager.dart';
import 'package:tech_tide/core/res/strings_manager.dart';
import 'package:tech_tide/core/res/styles_manager.dart';

class HeaderImageWidget extends StatelessWidget {
  const HeaderImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return SizedBox(
      height: height * 0.3,
      width: double.infinity,
      child: const Stack(
        children: [
          Image(
            image: AssetImage(
              AssetsManager.signupImagePath,
            ),
            fit: BoxFit.cover,
          ),
          Align(
            alignment: AlignmentDirectional.bottomCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  AppStrings.appTitle,
                  textAlign: TextAlign.center,
                  style: StylesManager.bold32,
                ),
                Text(
                  AppStrings.sloganMessage,
                  style: StylesManager.semiBold18,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
