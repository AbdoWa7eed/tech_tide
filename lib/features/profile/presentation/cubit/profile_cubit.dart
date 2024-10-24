import 'package:bloc/bloc.dart';
import 'package:tech_tide/core/di/di.dart';
import 'package:tech_tide/features/profile/domain/entities/profile_entity.dart';
import 'package:tech_tide/features/profile/domain/repo/profile_repo.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this._profileRepository) : super(ProfileInitial());

  final ProfileRepository _profileRepository;

  Future<void> getProfile() async {
    emit(ProfileLoading());
    final result = _profileRepository.getProfile();
    result.fold(
      (failure) => emit(ProfileError(failure.message)),
      (stream) {
        stream.listen(
          (profile) {
            emit(ProfileLoaded(profile));
          },
        );
      },
    );
  }

  @override
  Future<void> close() {
    ServiceLocator.unregister<ProfileCubit>();
    return super.close();
  }
}
