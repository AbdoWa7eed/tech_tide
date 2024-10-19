import 'package:bloc/bloc.dart';
import 'package:tech_tide/features/manage_post/domain/repo/manage_post_repo.dart';

part 'manage_post_state.dart';

class ManagePostCubit extends Cubit<ManagePostState> {
  ManagePostCubit(this.managePostCubit) : super(ManagePostInitial());

  final ManagePostRepository managePostCubit;

  void toggleLikePost(String postId) async {
    final result = await managePostCubit.toggleLikePost(postId);
    result.fold(
      (l) => emit(ManagePostError(l.message)),
      (r) => emit(ManagePostSuccess()),
    );
  }

  void toggleSavePost(String postId) async {
    final result = await managePostCubit.toggleSavePost(postId);
    result.fold(
      (l) => emit(ManagePostError(l.message)),
      (r) => emit(ManagePostSuccess()),
    );
  }
}
