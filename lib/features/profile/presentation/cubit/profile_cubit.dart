import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:tech_tide/core/di/di.dart';
import 'package:tech_tide/features/profile/domain/entities/profile_entity.dart';
import 'package:tech_tide/features/profile/domain/repo/profile_repo.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this._profileRepository) : super(ProfileInitial());

  final ProfileRepository _profileRepository;

  late StreamSubscription _profileSubscription;

  late ProfileEntity _profileEntity;

  ProfileEntity get profileEntity => _profileEntity;

  Future<void> getProfile({String? userId}) async {
    emit(ProfileLoading());
    final result = _profileRepository.getProfile(userId: userId);
    result.fold(
      (failure) => emit(ProfileError(failure.message)),
      (stream) {
        _profileSubscription = stream.listen(
          (profile) {
            _profileEntity = profile;
            emit(ProfileLoaded());
          },
        );
      },
    );
  }

  Future<void> logout() async {
    emit(LogoutLoading());
    final result = await _profileRepository.logout();
    result.fold(
      (failure) => emit(LogoutError(failure.message)),
      (success) => emit(LogoutSuccess()),
    );
  }

  @override
  Future<void> close() {
    _profileSubscription.cancel();
    ServiceLocator.unregister<ProfileCubit>();
    return super.close();
  }
}
