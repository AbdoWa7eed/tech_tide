import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tech_tide/core/di/di.dart';
import 'package:tech_tide/core/res/strings_manager.dart';
import 'package:tech_tide/core/routes/routes_manager.dart';
import 'package:tech_tide/core/utils/app_preferences.dart';

import 'core/res/theme_manager.dart';

class TechTideApp extends StatefulWidget {
  const TechTideApp._internal();

  static const TechTideApp _instance = TechTideApp._internal();

  factory TechTideApp() => _instance;

  @override
  State<TechTideApp> createState() => _TechTideAppState();
}

class _TechTideAppState extends State<TechTideApp> {
  late final AppPreferences _appPreferences;

  @override
  void initState() {
    _appPreferences = ServiceLocator.get<AppPreferences>();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    context.setLocale(_appPreferences.getAppLocal());
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
      debugShowCheckedModeBanner: false,
      locale: context.locale,
      theme: appTheme,
      routerConfig: RouteGenerator.router,
      title: AppStrings.appTitle,
    );
  }
}
