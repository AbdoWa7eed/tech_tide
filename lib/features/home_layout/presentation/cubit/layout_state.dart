part of 'layout_cubit.dart';

sealed class LayoutState {}

class LayoutInitial extends LayoutState {}

class LayoutLoading extends LayoutState {}

class LayoutLoaded extends LayoutState {
  final UserEntity user;

  LayoutLoaded(this.user);
}

class LayoutError extends LayoutState {
  final String message;
  LayoutError(this.message);
}

class ChangeNavBarIndexState extends LayoutState {}
