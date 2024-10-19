import 'package:bloc/bloc.dart';
import 'package:tech_tide/core/di/di.dart';
import 'package:tech_tide/core/entities/post_entity.dart';
import 'package:tech_tide/core/utils/extensions.dart';
import 'package:tech_tide/features/home/domain/entities/popular_topic_entity.dart';
import 'package:tech_tide/features/home/domain/repo/home_repo.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._repo) : super(HomeInitial());

  final HomeRepository _repo;

  void loadHome() async {
    final popularTopics = await _repo.getPopularTopics();
    if (popularTopics.isLeft()) {
      return emit(HomeError(popularTopics.failure.message));
    }
    final trendingPosts = _repo.getTrendingPosts();
    trendingPosts.fold((failure) => emit(HomeError(failure.message)), (value) {
      value.listen((event) {
        emit(HomeLoaded(popularTopics.value, event));
      });
    });
  }

  @override
  Future<void> close() {
    ServiceLocator.unregister<HomeCubit>();
    return super.close();
  }
}
