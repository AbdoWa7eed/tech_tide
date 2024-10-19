part of 'routes_manager.dart';

abstract class Routes {
  static const String initialRoute = '/';
  static const String onboardingRoute = '/onboarding';
  static const String signUpRoute = '/sign-up';
  static const String loginRoute = '/login';
  static const String homeRoute = '/home';
  static const String popularTopicsRoute = '/popular-topics';
  static const String postDetailsRoute = '/post-details';
  static const String eventDetailsRoute = '/event-details';
}

abstract class RouteGenerator {
  static final GoRouter router =
      GoRouter(initialLocation: Routes.initialRoute, routes: _routes);

  static List<GoRoute> get _routes {
    return [
      GoRoute(
        path: Routes.eventDetailsRoute,
        builder: (context, state) {
          return const EventDetailsView();
        },
      ),
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
        path: Routes.loginRoute,
        builder: (context, state) {
          ServiceLocator.initAuth();
          return BlocProvider<AuthCubit>(
            create: (context) => ServiceLocator.get(),
            child: const LoginView(),
          );
        },
      ),
      GoRoute(
        path: Routes.signUpRoute,
        pageBuilder: (context, state) {
          return CustomSlideTransition(
            child: BlocProvider<AuthCubit>.value(
              value: ServiceLocator.get(),
              child: const SignupView(),
            ),
          );
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
      GoRoute(
        path: Routes.popularTopicsRoute,
        pageBuilder: (context, state) {
          return CustomSlideTransition(child: const PopularTopicView());
        },
      ),
      GoRoute(
        path: Routes.postDetailsRoute,
        pageBuilder: (context, state) {
          return CustomSlideTransition(child: const PostDetailsView());
        },
      ),
    ];
  }
}
