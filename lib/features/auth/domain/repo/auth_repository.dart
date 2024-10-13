import 'package:tech_tide/core/utils/typedefs.dart';
import 'package:tech_tide/features/auth/data/models/user_login_request.dart';
import 'package:tech_tide/features/auth/data/models/user_register_request.dart';
import 'package:tech_tide/features/auth/domain/entities/user_entity.dart';

abstract class AuthRepository {
  ResultFuture<UserEntity> login(UserLoginRequest request);
  ResultFuture<UserEntity> register(UserRegisterRequest request);
}
