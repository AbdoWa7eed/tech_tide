import 'package:flutter/material.dart';
import 'package:tech_tide/core/res/values_manager.dart';
import 'package:tech_tide/features/auth/presentation/widgets/header_image_widget.dart';
import 'package:tech_tide/features/auth/presentation/widgets/signup_view_body.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: SizedBox(
          height: height,
          child: Stack(
            children: [
              const HeaderImageWidget(),
              Positioned(
                top: height * 0.26,
                right: 0,
                left: 0,
                bottom: 0,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(AppSize.s20),
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsetsDirectional.only(
                      top: AppPadding.p18,
                      start: AppPadding.p20,
                      end: AppPadding.p20,
                    ),
                    child: SignupViewBody(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
