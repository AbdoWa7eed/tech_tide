part of 'routes_manager.dart';

abstract class Routes {
  static const String initialRoute = '/';
}

abstract class RouteGenerator {
  static final GoRouter router =
      GoRouter(initialLocation: Routes.initialRoute, routes: _routes);

  static List<GoRoute> get _routes {
    return [
      GoRoute(
        path: Routes.initialRoute,
        builder: (context, state) {
          return const SplashView();
        },
      ),
    ];
  }
}
