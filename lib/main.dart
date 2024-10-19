import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tech_tide/app.dart';
import 'package:tech_tide/bloc_observer.dart';
import 'package:tech_tide/core/di/di.dart';
import 'package:tech_tide/core/utils/local_manager.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Future.wait([
    EasyLocalization.ensureInitialized(),
    Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    )
  ]);

  await ServiceLocator.init();
  Bloc.observer = MyBlocObserver();
  runApp(EasyLocalization(
    path: LocaleManager.assetsTranslationPath,
    fallbackLocale: LocaleManager.defaultLocale,
    supportedLocales: LocaleManager.locals,
    child: TechTideApp(),
  ));
}
