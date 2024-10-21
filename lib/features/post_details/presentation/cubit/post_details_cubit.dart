import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:tech_tide/core/di/di.dart';
import 'package:tech_tide/features/post_details/domain/entities/post_details_entity.dart';
import 'package:tech_tide/features/post_details/domain/repo/post_details_repo.dart';

part 'post_details_state.dart';

class PostDetailsCubit extends Cubit<PostDetailsState> {
  PostDetailsCubit(this._repo) : super(PostDetailsInitial());
  final PostDetailsRepository _repo;

  late final String postId;

  late PostDetailsEntity _post;

  late StreamSubscription<PostDetailsEntity> _postSubscription;

  PostDetailsEntity get post => _post;

  void initPostDetails(String postId) {
    this.postId = postId;
    getPostDetails();
  }

  void getPostDetails() async {
    emit(PostDetailsLoading());
    final result = _repo.getPostDetails(postId);
    result.fold(
      (failure) => emit(PostDetailsError(failure.message)),
      (postStream) {
        _postSubscription = postStream.listen(
          (post) {
            _post = post;
            emit(PostDetailsLoaded());
          },
        );
      },
    );
  }

  void addReply(String content) async {
    emit(AddReplyLoading());
    final result = await _repo.addReplyToPost(content, postId);
    result.fold(
      (failure) => emit(AddReplyError(failure.message)),
      (success) => emit(AddReplySuccess()),
    );
  }

  void toggleLikeReply(String replyId) async {
    emit(ToggleLikeReplyLoading());
    final result = await _repo.toggleLikeReply(postId, replyId);
    result.fold(
      (failure) => emit(ToggleLikeReplyError(failure.message)),
      (success) => emit(ToggleLikeReplySuccess()),
    );
  }

  @override
  Future<void> close() {
    ServiceLocator.unregister<PostDetailsCubit>();
    _postSubscription.cancel();
    return super.close();
  }
}
