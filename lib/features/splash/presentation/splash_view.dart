import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tech_tide/features/splash/presentation/widget/splash_view_body.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return const AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SplashViewBody(),
      ),
    );
  }
}
