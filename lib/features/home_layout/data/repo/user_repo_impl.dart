import 'package:dartz/dartz.dart';
import 'package:tech_tide/core/data/mappers/user_mapper.dart'; // Make sure you have a mapper to convert models to entities
import 'package:tech_tide/core/entities/user_entity.dart';
import 'package:tech_tide/core/network/error_handler.dart';
import 'package:tech_tide/core/utils/typedefs.dart';
import 'package:tech_tide/features/home_layout/data/data_source/user_data_source.dart';
import 'package:tech_tide/features/home_layout/domain/repo/user_repo.dart';

class UserRepositoryImpl implements UserRepository {
  final UserDataSource _userDataSource;

  UserRepositoryImpl(this._userDataSource);

  @override
  ResultFuture<UserEntity> getUser() async {
    try {
      final userResponseModel = await _userDataSource.getUser();
      return Right(userResponseModel.toEntity());
    } catch (e) {
      return Left(ErrorHandler.handleException(e));
    }
  }
}
