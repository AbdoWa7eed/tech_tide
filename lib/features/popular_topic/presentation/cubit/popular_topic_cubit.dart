import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:tech_tide/core/di/di.dart';
import 'package:tech_tide/core/entities/post_entity.dart';
import 'package:tech_tide/features/popular_topic/domain/repo/popular_topic_repo.dart';

part 'popular_topic_state.dart';

class PopularTopicCubit extends Cubit<PopularTopicState> {
  PopularTopicCubit(this._repository) : super(PopularTopicInitial());

  final PopularTopicRepository _repository;

  late StreamSubscription<List<PostEntity>> _postSubscription;

  late final String topic;

  getTopicPosts(String topic) {
    this.topic = topic;
    emit(PopularTopicLoading());
    final result = _repository.getTopicPosts(topic);
    result.fold(
      (failure) => emit(PopularTopicError(failure.message)),
      (posts) {
        _postSubscription = posts.listen(
          (posts) => emit(PopularTopicLoaded(posts)),
        );
      },
    );
  }

  @override
  Future<void> close() {
    ServiceLocator.unregister<PopularTopicCubit>();
    _postSubscription.cancel();
    return super.close();
  }
}
