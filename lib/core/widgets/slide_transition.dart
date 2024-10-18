import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tech_tide/core/res/ui_constants.dart';

class CustomSlideTransition extends CustomTransitionPage {
  CustomSlideTransition({required super.child})
      : super(
          transitionDuration:
              const Duration(milliseconds: UiConstants.pageTransitionDelay),
          reverseTransitionDuration: const Duration(
              milliseconds: UiConstants.pageReverseTransitionDelay),
          transitionsBuilder: (context, animation, anotherAnimation, child) {
            animation = CurvedAnimation(
                curve: Curves.fastLinearToSlowEaseIn,
                parent: animation,
                reverseCurve: Curves.fastOutSlowIn);
            return SlideTransition(
              position: Tween(
                      begin: const Offset(1.0, 0.0),
                      end: const Offset(0.0, 0.0))
                  .animate(animation),
              child: child,
            );
          },
        );
}
