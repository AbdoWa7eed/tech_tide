import 'package:flutter/material.dart';

enum LanguageType { english, arabic }

const String _arabic = "ar";
const String _english = "en";

abstract class LocaleManager {
  static const assetsTranslationPath = "assets/translations";
  static const defaultLocale = Locale(_english);
  static const locals = [
    Locale(_english),
    Locale(_arabic),
  ];

  static Locale localeFromString(String languageCode) {
    return locals.firstWhere((l) => l.languageCode == languageCode,
        orElse: () => defaultLocale);
  }
}

extension LanguageTypeExtension on LanguageType {
  String get value {
    switch (this) {
      case LanguageType.english:
        return _english;
      case LanguageType.arabic:
        return _arabic;
    }
  }
}
