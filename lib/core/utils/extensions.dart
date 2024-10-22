import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tech_tide/core/di/di.dart';
import 'package:tech_tide/core/utils/app_preferences.dart';

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

extension EitherX<Failure, R> on Either<Failure, R> {
  R get value => (this as Right<Failure, R>).value;

  Failure get failure => (this as Left<Failure, R>).value;
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

extension DateTimeExtension on DateTime {
  String get timeAgo {
    final now = DateTime.now();
    final difference = now.difference(this);

    if (difference.inDays == 0) {
      if (difference.inHours == 0) {
        return 'minutes_ago'.tr(args: [difference.inMinutes.toString()]);
      } else {
        return 'hours_ago'.tr(args: [difference.inHours.toString()]);
      }
    } else if (difference.inDays == 1) {
      return 'yesterday'.tr();
    } else if (difference.inDays < 7) {
      return 'days_ago'.tr(args: [difference.inDays.toString()]);
    } else {
      final appPreferences = ServiceLocator.get<AppPreferences>();
      return DateFormat.yMMMd(appPreferences.getAppLocal().languageCode)
          .format(this);
    }
  }

  String get formattedMonth => DateFormat('MMM').format(this);
  String get formattedDay => DateFormat('d').format(this);
}
