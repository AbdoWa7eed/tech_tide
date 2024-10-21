import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tech_tide/core/di/di.dart';
import 'package:tech_tide/features/add_post/data/models/add_post_request.dart';
import 'package:tech_tide/features/add_post/domain/repo/add_post_repo.dart';

part 'add_post_state.dart';

class AddPostCubit extends Cubit<AddPostState> {
  AddPostCubit(this._addPostRepository) : super(AddPostInitial());

  final AddPostRepository _addPostRepository;

  void addPost({
    required String title,
    required String content,
  }) async {
    emit(AddPostLoading());
    final result = await _addPostRepository.addPost(
      AddPostRequest(
          title: title,
          content: content,
          tags: tags,
          attachedImages: attachedImages),
    );
    result.fold(
      (l) => emit(AddPostError(l.message)),
      (r) => emit(AddPostSuccess()),
    );
  }

  final List<File> attachedImages = [];
  final List<String> tags = [];

  void pickImage() async {
    final imagePicker = ImagePicker();
    final pickImage = await imagePicker.pickImage(source: ImageSource.gallery);
    if (pickImage != null) {
      attachedImages.add(File(pickImage.path));
      emit(PostDataUpdatedState());
    }
  }

  void removeImage(File image) {
    attachedImages.remove(image);
    emit(PostDataUpdatedState());
  }

  void addTag(String tag) {
    if (tag.isNotEmpty && !tags.contains(tag)) {
      tags.add(tag);
      emit(PostDataUpdatedState());
    }
  }

  void removeTag(String tag) {
    tags.remove(tag);
    emit(PostDataUpdatedState());
  }

  @override
  Future<void> close() {
    ServiceLocator.unregister<AddPostCubit>();
    return super.close();
  }
}
