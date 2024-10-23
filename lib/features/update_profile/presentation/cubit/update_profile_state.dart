part of 'update_profile_cubit.dart';

sealed class UpdateProfileState {}

final class UpdateProfileInitial extends UpdateProfileState {}

final class PickImageState extends UpdateProfileState {}
