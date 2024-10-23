import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tech_tide/core/di/di.dart';
import 'package:tech_tide/core/entities/user_entity.dart';
import 'package:tech_tide/core/res/strings_manager.dart';
import 'package:tech_tide/core/utils/extensions.dart';
import 'package:tech_tide/features/update_profile/data/models/update_profile_request.dart';
import 'package:tech_tide/features/update_profile/domain/repo/update_profile_repo.dart';

part 'update_profile_state.dart';

class UpdateProfileCubit extends Cubit<UpdateProfileState> {
  UpdateProfileCubit(this._repository) : super(UpdateProfileInitial());

  final UpdateProfileRepository _repository;

  late UserEntity user;

  void setUser(UserEntity user) {
    this.user = user;
  }

  void updateProfile({
    required String username,
    required String bio,
  }) async {
    emit(UpdateProfileLoading());
    final request = _buildRequest(username: username, bio: bio);
    if (request == null) return;
    final result = await _repository.updateProfile(request);
    result.fold((failure) => emit(UpdateProfileError(failure.message)), (user) {
      this.user = user;
      emit(UpdateProfileSuccess(user));
    });
  }

  UpdateProfileRequest? _buildRequest({
    required String username,
    required String bio,
  }) {
    if (user.username == username && user.bio == bio && profileImage == null) {
      emit(UpdateProfileError(AppStrings.noDataToUpdate.translate));
      return null;
    }
    return UpdateProfileRequest(
      username: user.username == username ? null : username,
      bio: user.bio == bio ? null : bio,
      image: profileImage,
    );
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

  @override
  Future<void> close() {
    ServiceLocator.unregister<UpdateProfileCubit>();
    return super.close();
  }
}
