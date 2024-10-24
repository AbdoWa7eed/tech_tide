import 'package:tech_tide/core/utils/typedefs.dart';
import 'package:tech_tide/features/profile/domain/entities/profile_entity.dart';

abstract class ProfileRepository {
  ResultStream<ProfileEntity> getProfile();
}
