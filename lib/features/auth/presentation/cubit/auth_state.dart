part of 'auth_cubit.dart';

sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class AuthSuccess extends AuthState {
  UserEntity user;

  AuthSuccess(this.user);
}

final class AuthError extends AuthState {
  String message;

  AuthError(this.message);
}
