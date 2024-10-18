import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';

part 'add_post_state.dart';

class AddPostCubit extends Cubit<AddPostState> {
  AddPostCubit() : super(AddPostInitial());

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
}
