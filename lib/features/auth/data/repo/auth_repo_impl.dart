import 'package:dartz/dartz.dart';
import 'package:tech_tide/core/network/error_handler.dart';
import 'package:tech_tide/core/utils/typedefs.dart';
import 'package:tech_tide/features/auth/data/data_source/auth_data_source.dart';
import 'package:tech_tide/features/auth/data/mapper/user_mapper.dart';
import 'package:tech_tide/features/auth/data/models/user_login_request.dart';
import 'package:tech_tide/features/auth/data/models/user_register_request.dart';
import 'package:tech_tide/features/auth/domain/entities/user_entity.dart';
import 'package:tech_tide/features/auth/domain/repo/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSource _authDataSource;

  AuthRepositoryImpl(this._authDataSource);

  @override
  ResultFuture<UserEntity> login(UserLoginRequest request) async {
    try {
      final response = await _authDataSource.login(request);
      return Right(response.toEntity());
    } catch (e) {
      return Left(ErrorHandler.handleException(e));
    }
  }

  @override
  ResultFuture<UserEntity> register(UserRegisterRequest request) async {
    try {
      final response = await _authDataSource.register(request);
      return Right(response.toEntity());
    } catch (e) {
      return Left(ErrorHandler.handleException(e));
    }
  }
}
