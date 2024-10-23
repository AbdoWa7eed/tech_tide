import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tech_tide/core/entities/user_entity.dart';

part 'update_profile_state.dart';

class UpdateProfileCubit extends Cubit<UpdateProfileState> {
  UpdateProfileCubit() : super(UpdateProfileInitial());

  late UserEntity user;

  void setUser(UserEntity user) {
    this.user = user;
  }

  File? profileImage;

  void pickImage() async {
    final imagePicker = ImagePicker();
    final pickImage = await imagePicker.pickImage(source: ImageSource.gallery);
    if (pickImage != null) {
      profileImage = File(pickImage.path);
      emit(PickImageState());
    }
  }
}
