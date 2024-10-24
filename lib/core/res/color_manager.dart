import 'package:flutter/material.dart';

abstract class ColorManager {
  static const Color white = Color(0xffFFFFFF);
  static const Color black = Color(0xff000000);
  static const Color error = Color(0xffe61f34);
  static const Color primary = Color(0xff378CE7);
  static const Color primaryWith10Opacity = Color(0x1a378CE7);
  static const Color primaryWith40Opacity = Color(0x7A378CE7);
  static const Color gray = Color(0xff757575);
  static const Color deepTeal = Color(0xff174270);
  static const Color yellow = Color(0xffFAFF00);
  static const Color lightGray = Color(0xffD3D3D3);
  static const Color paleBlue = Color(0xffB1C0E3);
  static const Color babyBlue = Color(0xffEBF5F8);
  static const Color babyBlue2 = Color(0xFFB0E6FF);
  static const Color whiteWith40Opacity = Color(0x66ffffff);
  static const Gradient gradientColor = LinearGradient(
    begin: AlignmentDirectional.centerStart,
    end: AlignmentDirectional.centerEnd,
    colors: [
      Color(0xff256BB5),
      primary,
      Color(0xff4AA8F8),
    ],
  );

  static const popularTopicsColors = [
    Color(0xff6164FF),
    primary,
    Color(0xff67C6E3),
  ];
}
