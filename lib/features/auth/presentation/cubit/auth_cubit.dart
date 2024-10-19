import 'package:bloc/bloc.dart';
import 'package:tech_tide/core/di/di.dart';
import 'package:tech_tide/core/entities/user_entity.dart';
import 'package:tech_tide/core/utils/app_preferences.dart';
import 'package:tech_tide/features/auth/data/models/user_login_request.dart';
import 'package:tech_tide/features/auth/data/models/user_register_request.dart';
import 'package:tech_tide/features/auth/domain/repo/auth_repository.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._authRepository, this._appPreferences) : super(AuthInitial());

  final AuthRepository _authRepository;
  final AppPreferences _appPreferences;

  void login({
    required String email,
    required String password,
  }) async {
    emit(AuthLoading());
    final result = await _authRepository
        .login(UserLoginRequest(email: email, password: password));
    result.fold(
      (failure) => emit(AuthError(failure.message)),
      (user) async {
        await _appPreferences.setUserId(user.userId);
        emit(AuthSuccess(user));
      },
    );
  }

  void register({
    required String username,
    required String email,
    required String password,
  }) async {
    emit(AuthLoading());
    final result = await _authRepository.register(
      UserRegisterRequest(
        username: username,
        email: email,
        password: password,
      ),
    );

    result.fold(
      (failure) => emit(AuthError(failure.message)),
      (user) async {
        await _appPreferences.setUserId(user.userId);
        emit(AuthSuccess(user));
      },
    );
  }

  @override
  Future<void> close() {
    ServiceLocator.unRegisterAuth();
    return super.close();
  }
}
