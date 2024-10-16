import 'package:flutter/material.dart';
import 'package:tech_tide/core/res/values_manager.dart';
import 'package:tech_tide/features/auth/presentation/widgets/header_image_widget.dart';
import 'package:tech_tide/features/auth/presentation/widgets/signup_view_body.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          child: Stack(
            children: [
              const HeaderImageWidget(),
              Positioned(
                top: size.height * 0.26,
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(AppSize.s20),
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: AppPadding.p18, horizontal: AppPadding.p20),
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
