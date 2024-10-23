import 'package:easy_localization/easy_localization.dart';
import 'package:tech_tide/core/entities/user_entity.dart';

class EventEntity {
  final String eventId;
  final String title;
  final String description;
  final DateTime startDateTime;
  final DateTime endDateTime;
  final List<UserEntity> goingUsers;
  final String governorate;
  final String imageUrl;
  final String address;

  EventEntity({
    required this.eventId,
    required this.endDateTime,
    required this.title,
    required this.description,
    required this.startDateTime,
    required this.goingUsers,
    required this.governorate,
    required this.imageUrl,
    required this.address,
  });

  String get formattedDateTime {
    final DateFormat dateFormat = DateFormat('MMM d');
    final DateFormat timeFormat = DateFormat('h:mm a');

    String startDate = dateFormat.format(startDateTime);
    String startTime = timeFormat.format(startDateTime);
    String endTime = timeFormat.format(endDateTime);

    return '$startDate, $startTime - $endTime';
  }
}
