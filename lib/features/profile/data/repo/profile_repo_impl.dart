import 'package:dartz/dartz.dart';
import 'package:tech_tide/core/network/error_handler.dart';
import 'package:tech_tide/core/utils/typedefs.dart';
import 'package:tech_tide/features/profile/data/data_source/profile_data_source.dart';
import 'package:tech_tide/features/profile/data/mapper/mapper.dart';
import 'package:tech_tide/features/profile/domain/entities/profile_entity.dart';
import 'package:tech_tide/features/profile/domain/repo/profile_repo.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileDataSource _profileDataSource;

  ProfileRepositoryImpl(this._profileDataSource);

  @override
  ResultStream<ProfileEntity> getProfile() {
    try {
      final result = _profileDataSource.getProfile().map((profile) {
        final profileEntity = profile.toEntity();
        return profileEntity;
      }).handleError((error) {
        return Left(ErrorHandler.handleException(error));
      });
      return Right(result);
    } catch (e) {
      return Left(ErrorHandler.handleException(e));
    }
  }
}