import 'dart:ui';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:tech_tide/core/utils/local_manager.dart';

const String _prefsKeyLanguage = "PREFS_KEY_LANG";

const String _prefsKeyOnboarding = "PREFS_KEY_ONBOARDING";

class AppPreferences {
  final SharedPreferences _sharedPreferences;

  AppPreferences(this._sharedPreferences);

  Locale getAppLocal() {
    String? language = _sharedPreferences.getString(_prefsKeyLanguage);
    if (language != null && language.isNotEmpty) {
      return LocaleManager.localeFromString(language);
    } else {
      return LocaleManager.defaultLocale;
    }
  }

  String appLanguageCode() {
    String? language = _sharedPreferences.getString(_prefsKeyLanguage);
    if (language != null && language.isNotEmpty) {
      return language;
    } else {
      return LanguageType.english.value;
    }
  }

  Future changeAppLanguage() async {
    String? language = _sharedPreferences.getString(_prefsKeyLanguage);
    if (language == null || language.isEmpty) {
      await setAppLanguage(LanguageType.arabic);
    } else if (language == LanguageType.arabic.value) {
      await setAppLanguage(LanguageType.english);
    } else {
      await setAppLanguage(LanguageType.arabic);
    }
  }

  Future<void> setAppLanguage(LanguageType language) async {
    await _sharedPreferences.setString(_prefsKeyLanguage, language.value);
  }

  Future<void> setOnBoardingViewed() async {
    await _sharedPreferences.setBool(_prefsKeyOnboarding, true);
  }

  bool get isOnBoardingViewed {
    return _sharedPreferences.getBool(_prefsKeyOnboarding) ?? false;
  }
}
