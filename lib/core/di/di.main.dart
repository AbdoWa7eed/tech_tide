part of 'di.dart';

abstract class ServiceLocator {
  static final _getIt = GetIt.instance;

  static T get<T extends Object>() => _getIt<T>();

  static unregister<T extends Object>() => _getIt.unregister<T>();

  static Future init() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    _getIt
      ..registerLazySingleton<AppPreferences>(
          () => AppPreferences(sharedPreferences))
      ..registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance)
      ..registerLazySingleton<FirebaseStorage>(() => FirebaseStorage.instance)
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
        ..registerLazySingleton<AuthCubit>(() => AuthCubit(_getIt()));
    }
  }

  static unRegisterAuth() {
    _getIt.unregister<AuthDataSource>();
    _getIt.unregister<AuthRepository>();
    _getIt.unregister<AuthCubit>();
  }

  static initPostResource() {
    if (!_getIt.isRegistered<ManagePostCubit>()) {
      _getIt
        ..registerLazySingleton<PostsDataSource>(
            () => PostsDataSourceImpl(_getIt()))
        ..registerLazySingleton<ManagePostDataSource>(
            () => ManagePostDataSourceImpl(_getIt(), _getIt()))
        ..registerLazySingleton<ManagePostRepository>(
            () => ManagePostRepositoryImpl(_getIt()))
        ..registerLazySingleton<ManagePostCubit>(
            () => ManagePostCubit(_getIt()));
    }
  }

  static Future initHomeLayout() async {
    initPostResource();
    if (!_getIt.isRegistered<UserDataSource>()) {
      _getIt
        ..registerLazySingleton<UserDataSource>(
            () => UserDataSourceImpl(_getIt(), _getIt()))
        ..registerLazySingleton<UserRepository>(
            () => UserRepositoryImpl(_getIt()));
    }

    if (!_getIt.isRegistered<LayoutCubit>()) {
      _getIt.registerLazySingleton<LayoutCubit>(() => LayoutCubit(_getIt()));
    }

    initHome();
    initEvents();
    initProfile();
  }

  static initHome() {
    if (!_getIt.isRegistered<HomeRepository>()) {
      _getIt
        ..registerLazySingleton<HomeDataSource>(
            () => HomeDataSourceImpl(_getIt(), _getIt()))
        ..registerLazySingleton<HomeRepository>(
            () => HomeRepositoryImpl(_getIt()));
    }
    if (!_getIt.isRegistered<HomeCubit>()) {
      _getIt.registerLazySingleton<HomeCubit>(() => HomeCubit(_getIt()));
    }
  }

  static initPopularTopic() {
    if (!_getIt.isRegistered<PopularTopicRepository>()) {
      _getIt
        ..registerLazySingleton<PopularTopicDataSource>(
            () => PopularTopicDataSourceImpl(_getIt(), _getIt()))
        ..registerLazySingleton<PopularTopicRepository>(
            () => PopularTopicRepositoryImpl(_getIt()));
    }
    if (!_getIt.isRegistered<PopularTopicCubit>()) {
      _getIt.registerFactory<PopularTopicCubit>(
          () => PopularTopicCubit(_getIt()));
    }
  }

  static initPostDetails() {
    if (!_getIt.isRegistered<PostDetailsRepository>()) {
      _getIt
        ..registerLazySingleton<PostDetailsDataSource>(
            () => PostDetailsDataSourceImpl(_getIt(), _getIt(), _getIt()))
        ..registerLazySingleton<PostDetailsRepository>(
            () => PostDetailsRepositoryImpl(_getIt()));
    }
    if (!_getIt.isRegistered<PostDetailsCubit>()) {
      _getIt
          .registerFactory<PostDetailsCubit>(() => PostDetailsCubit(_getIt()));
    }
  }

  static initAddPost() {
    if (!_getIt.isRegistered<AddPostRepository>()) {
      _getIt
        ..registerLazySingleton<AddPostDataSource>(
            () => AddPostDataSourceImpl(_getIt(), _getIt(), _getIt()))
        ..registerLazySingleton<AddPostRepository>(
            () => AddPostRepositoryImpl(_getIt()));
    }
    if (!_getIt.isRegistered<AddPostCubit>()) {
      _getIt.registerFactory<AddPostCubit>(() => AddPostCubit(_getIt()));
    }
  }

  static initEvents() {
    if (!_getIt.isRegistered<EventsRepository>()) {
      _getIt
        ..registerLazySingleton<EventsDataSource>(
            () => EventsDataSourceImpl(_getIt(), _getIt()))
        ..registerLazySingleton<EventsRepository>(
            () => EventsRepositoryImpl(_getIt()));
    }
    if (!_getIt.isRegistered<EventsCubit>()) {
      _getIt.registerLazySingleton<EventsCubit>(() => EventsCubit(_getIt()));
    }
  }

  static initProfile() {
    if (!_getIt.isRegistered<ProfileRepository>()) {
      _getIt
        ..registerLazySingleton<ProfileDataSource>(
            () => ProfileDataSourceImpl(_getIt(), _getIt(), _getIt(), _getIt()))
        ..registerLazySingleton<ProfileRepository>(
            () => ProfileRepositoryImpl(_getIt()));
    }
    if (!_getIt.isRegistered<ProfileCubit>()) {
      _getIt.registerLazySingleton<ProfileCubit>(() => ProfileCubit(_getIt()));
    }
  }

  static initUpdateProfile() {
    if (!_getIt.isRegistered<UpdateProfileRepository>()) {
      _getIt
        ..registerLazySingleton<UpdateProfileDataSource>(() =>
            UpdateProfileDataSourceImpl(_getIt(), _getIt(), _getIt(), _getIt()))
        ..registerLazySingleton<UpdateProfileRepository>(
            () => UpdateProfileRepositoryImpl(_getIt()));
    }
    if (!_getIt.isRegistered<UpdateProfileCubit>()) {
      _getIt.registerFactory<UpdateProfileCubit>(
          () => UpdateProfileCubit(_getIt()));
    }
  }
}
