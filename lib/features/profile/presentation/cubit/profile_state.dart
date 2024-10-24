part of 'profile_cubit.dart';

sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class ProfileLoading extends ProfileState {}

final class ProfileLoaded extends ProfileState {}

final class ProfileError extends ProfileState {
  final String message;
  ProfileError(this.message);
}

final class LogoutLoading extends ProfileState {}

final class LogoutSuccess extends ProfileState {}

final class LogoutError extends ProfileState {
  final String message;
  LogoutError(this.message);
}
