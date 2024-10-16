part of 'routes_manager.dart';

abstract class Routes {
  static const String initialRoute = '/';
  static const String onboardingRoute = '/onboarding';
  static const String signUpRoute = '/sign-up';
  static const String homeRoute = '/home';
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
      GoRoute(
        path: Routes.homeRoute,
        builder: (context, state) {
          ServiceLocator.initHome();
          return ChangeNotifierProvider<LayoutController>(
              create: (context) => ServiceLocator.get(),
              child: const HomeLayout());
        },
      ),
    ];
  }
}
