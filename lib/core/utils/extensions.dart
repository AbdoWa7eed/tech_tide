import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

extension NavigationExtension on BuildContext {
  void popAllThenPush(String location, {Object? extra}) {
    popAll(extra: extra);
    pushReplacement(location, extra: extra);
  }

  void popAll({Object? extra}) {
    while (canPop()) {
      pop(extra);
    }
  }
}

extension StringExtension on String? {
  String get translate => this?.tr() ?? orEmpty();

  String orEmpty() {
    return this == null ? '' : this!;
  }
}

extension NumExtension on num? {
  num orZero() {
    return this == null ? 0 : this!;
  }
}
