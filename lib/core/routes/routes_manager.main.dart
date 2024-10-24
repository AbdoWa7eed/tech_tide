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
  static const String chatRoute = '/chat';
  static const String updateProfile = '/update-profile';
  static const String profileRoute = '/profile';
  static const String savedPostsRoute = '/search';
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
            BlocProvider<EventsCubit>(
                create: (context) => ServiceLocator.get()..getEvents()),
            BlocProvider<ProfileCubit>(
                create: (context) => ServiceLocator.get()..getProfile()),
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
      GoRoute(
        path: Routes.eventDetailsRoute,
        pageBuilder: (context, state) {
          final event = state.extra as EventEntity;
          return CustomSlideTransition(
            child: MultiBlocProvider(
              providers: [
                BlocProvider<LayoutCubit>.value(value: ServiceLocator.get()),
                BlocProvider<EventsCubit>.value(value: ServiceLocator.get()),
              ],
              child: EventDetailsView(event: event),
            ),
          );
        },
      ),
      GoRoute(
        path: Routes.chatRoute,
        pageBuilder: (context, state) {
          final Map<String, dynamic> extra =
              state.extra as Map<String, dynamic>;
          final String chatuser = extra['chatuser'] as String;
          final String currentUserId = extra['currentUserId'] as String;
          final ChatResponseModel chat = extra['chat'] as ChatResponseModel;
          return CustomSlideTransition(
              child: ChatPage(
                  chatuserID: chatuser,
                  currentUserId: currentUserId,
                  chat: chat));
        },
      ),
      GoRoute(
        path: Routes.updateProfile,
        pageBuilder: (context, state) {
          ServiceLocator.initUpdateProfile();
          final user = ServiceLocator.get<LayoutCubit>().user;
          return CustomSlideTransition(
            child: MultiBlocProvider(
              providers: [
                BlocProvider<LayoutCubit>.value(value: ServiceLocator.get()),
                BlocProvider<UpdateProfileCubit>(
                  create: (context) => ServiceLocator.get()..setUser(user),
                )
              ],
              child: const UpdateProfileView(),
            ),
          );
        },
      ),
      GoRoute(
        path: Routes.savedPostsRoute,
        pageBuilder: (context, state) {
          return CustomSlideTransition(
            child: MultiBlocProvider(providers: [
              BlocProvider<LayoutCubit>.value(value: ServiceLocator.get()),
              BlocProvider<ManagePostCubit>.value(value: ServiceLocator.get()),
              BlocProvider<ProfileCubit>.value(
                value: ServiceLocator.get(),
              ),
            ], child: const SavedPostsView()),
          );
        },
      ),
      GoRoute(
        path: Routes.profileRoute,
        pageBuilder: (context, state) {
          final userId = state.extra as String;
          return CustomSlideTransition(
            child: MultiBlocProvider(providers: [
              BlocProvider<LayoutCubit>.value(value: ServiceLocator.get()),
              BlocProvider<ManagePostCubit>.value(value: ServiceLocator.get()),
              BlocProvider<ProfileCubit>.value(
                value: ServiceLocator.get()..getProfile(userId: userId),
              ),
            ], child: const ProfileView()),
          );
        },
      ),
    ];
  }
}
