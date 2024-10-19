import 'package:flutter/material.dart';
import 'package:tech_tide/core/res/values_manager.dart';
import 'package:tech_tide/features/auth/presentation/views/auth_listener_widget.dart';
import 'package:tech_tide/features/auth/presentation/widgets/header_image_widget.dart';
import 'package:tech_tide/features/auth/presentation/widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return AuthListenerWidget(
      child: Scaffold(
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
                      child: LoginViewBody(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
