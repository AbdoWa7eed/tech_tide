part of 'update_profile_cubit.dart';

sealed class UpdateProfileState {}

final class UpdateProfileInitial extends UpdateProfileState {}

final class UpdateProfileLoading extends UpdateProfileState {}

final class UpdateProfileSuccess extends UpdateProfileState {
  final UserEntity user;
  UpdateProfileSuccess(this.user);
}

final class UpdateProfileError extends UpdateProfileState {
  final String message;
  UpdateProfileError(this.message);
}

final class PickImageState extends UpdateProfileState {}
