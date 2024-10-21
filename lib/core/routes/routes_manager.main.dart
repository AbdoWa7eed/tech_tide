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
          ServiceLocator.initHomeLayout();
          return MultiBlocProvider(providers: [
            BlocProvider<ManagePostCubit>(
                create: (context) => ServiceLocator.get()),
            BlocProvider<LayoutCubit>(
                create: (context) => ServiceLocator.get()..loadUser()),
            BlocProvider<HomeCubit>(
                create: (context) => ServiceLocator.get()..loadHome()),
          ], child: const HomeLayout());
        },
      ),
      GoRoute(
        path: Routes.popularTopicsRoute,
        pageBuilder: (context, state) {
          ServiceLocator.initPopularTopic();
          final topic = state.extra as String;
          return CustomSlideTransition(
            child: MultiBlocProvider(providers: [
              BlocProvider<LayoutCubit>.value(value: ServiceLocator.get()),
              BlocProvider<ManagePostCubit>.value(value: ServiceLocator.get()),
              BlocProvider<PopularTopicCubit>(
                create: (context) => ServiceLocator.get()..getTopicPosts(topic),
              ),
            ], child: const PopularTopicView()),
          );
        },
      ),
      GoRoute(
        path: Routes.postDetailsRoute,
        pageBuilder: (context, state) {
          final postId = state.extra as String;
          ServiceLocator.initPostDetails();
          return CustomSlideTransition(
            child: MultiBlocProvider(providers: [
              BlocProvider<LayoutCubit>.value(value: ServiceLocator.get()),
              BlocProvider<ManagePostCubit>.value(value: ServiceLocator.get()),
              BlocProvider<PostDetailsCubit>(
                create: (context) =>
                    ServiceLocator.get()..initPostDetails(postId),
              ),
            ], child: const PostDetailsView()),
          );
        },
      ),
    ];
  }
}
