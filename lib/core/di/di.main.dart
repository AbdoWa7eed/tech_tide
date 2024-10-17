part of 'di.dart';

abstract class ServiceLocator {
  static final _getIt = GetIt.instance;

  static T get<T extends Object>() => _getIt<T>();

  static Future init() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    _getIt.registerLazySingleton<AppPreferences>(
        () => AppPreferences(sharedPreferences));
  }

  static Future initHome() async {
    if (!_getIt.isRegistered<LayoutController>()) {
      _getIt.registerLazySingleton<LayoutController>(() => LayoutController());
    }
  }
}
