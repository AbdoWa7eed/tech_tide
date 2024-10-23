import 'package:tech_tide/core/entities/user_entity.dart';
import 'package:tech_tide/core/utils/typedefs.dart';
import 'package:tech_tide/features/update_profile/data/models/update_profile_request.dart';

abstract class UpdateProfileRepository {
  ResultFuture<UserEntity> updateProfile(UpdateProfileRequest request);
}
