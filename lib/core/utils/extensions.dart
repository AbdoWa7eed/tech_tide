import 'package:dartz/dartz.dart';
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
        return '${difference.inMinutes}m ago';
      } else {
        return '${difference.inHours}h ago';
      }
    } else if (difference.inDays == 1) {
      return '1 day ago';
    } else if (difference.inDays < 7) {
      return '${difference.inDays} days ago';
    } else {
      return DateFormat('MMM d, yyyy').format(this);
    }
  }
}
