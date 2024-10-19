part of 'di.dart';

abstract class ServiceLocator {
  static final _getIt = GetIt.instance;

  static T get<T extends Object>() => _getIt<T>();

  static Future init() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    _getIt
      ..registerLazySingleton<AppPreferences>(
          () => AppPreferences(sharedPreferences))
      ..registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance)
      ..registerLazySingleton<FirebaseFirestore>(
          () => FirebaseFirestore.instance);
  }

  static initAuth() async {
    if (!_getIt.isRegistered<AuthCubit>()) {
      _getIt
        ..registerLazySingleton<AuthDataSource>(
            () => AuthDataSourceImpl(_getIt(), _getIt()))
        ..registerLazySingleton<AuthRepository>(
            () => AuthRepositoryImpl(_getIt()))
        ..registerLazySingleton<AuthCubit>(() => AuthCubit(_getIt(), _getIt()));
    }
  }

  static unRegisterAuth() {
    _getIt.unregister<AuthDataSource>();
    _getIt.unregister<AuthRepository>();
    _getIt.unregister<AuthCubit>();
  }

  static Future initHome() async {
    if (!_getIt.isRegistered<LayoutController>()) {
      _getIt.registerLazySingleton<LayoutController>(() => LayoutController());
    }
  }
}
