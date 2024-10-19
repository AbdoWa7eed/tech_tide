import 'package:tech_tide/core/entities/user_entity.dart';
import 'package:tech_tide/core/utils/typedefs.dart';

abstract class UserRepository {
  ResultFuture<UserEntity> getUser();
}
