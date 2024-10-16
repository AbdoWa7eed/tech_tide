part of 'routes_manager.dart';

abstract class Routes {
  static const String initialRoute = '/';
  static const String onboardingRoute = '/onboarding';
  static const String signUpRoute = '/sign-up';
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
      GoRoute(
        path: Routes.onboardingRoute,
        builder: (context, state) {
          return const OnboardingView();
        },
      ),
      GoRoute(
        path: Routes.signUpRoute,
        builder: (context, state) {
          return const SignupView();
        },
      ),
    ];
  }
}
