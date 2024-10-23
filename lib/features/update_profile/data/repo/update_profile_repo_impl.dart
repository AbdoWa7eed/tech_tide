import 'package:dartz/dartz.dart';
import 'package:tech_tide/core/data/mappers/user_mapper.dart';
import 'package:tech_tide/core/entities/user_entity.dart';
import 'package:tech_tide/core/network/error_handler.dart';
import 'package:tech_tide/core/utils/typedefs.dart';
import 'package:tech_tide/features/update_profile/data/data_source/update_profile_data_source.dart';
import 'package:tech_tide/features/update_profile/data/models/update_profile_request.dart';
import 'package:tech_tide/features/update_profile/domain/repo/update_profile_repo.dart';

class UpdateProfileRepositoryImpl implements UpdateProfileRepository {
  final UpdateProfileDataSource _updateProfileDataSource;

  UpdateProfileRepositoryImpl(this._updateProfileDataSource);

  @override
  ResultFuture<UserEntity> updateProfile(UpdateProfileRequest request) async {
    try {
      final updatedUser = await _updateProfileDataSource.updateProfile(request);
      return Right(updatedUser.toEntity());
    } catch (e) {
      return Left(ErrorHandler.handleException(e));
    }
  }
}
