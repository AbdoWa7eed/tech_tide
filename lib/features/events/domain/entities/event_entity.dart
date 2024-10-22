import 'package:tech_tide/core/entities/user_entity.dart';

class EventEntity {
  final String eventId;
  final String title;
  final String description;
  final DateTime dateTime;
  final List<UserEntity> goingUsers;
  final String governorate;
  final String imageUrl;
  final String address;

  EventEntity({
    required this.eventId,
    required this.title,
    required this.description,
    required this.dateTime,
    required this.goingUsers,
    required this.governorate,
    required this.imageUrl,
    required this.address,
  });
}
