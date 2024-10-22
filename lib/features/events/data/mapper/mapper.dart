import 'package:tech_tide/core/data/mappers/user_mapper.dart';
import 'package:tech_tide/core/utils/extensions.dart';
import 'package:tech_tide/features/events/data/models/event_response_model.dart';
import 'package:tech_tide/features/events/domain/entities/event_entity.dart';

extension EventMapper on EventResponseModel {
  EventEntity toEntity() {
    return EventEntity(
      eventId: eventId.orEmpty(),
      title: title.orEmpty(),
      description: description.orEmpty(),
      dateTime: dateTime ?? DateTime.now(),
      goingUsers: going?.map((user) => user.toEntity()).toList() ?? [],
      governorate: governorate.orEmpty(),
      imageUrl: imageUrl.orEmpty(),
      address: address.orEmpty(),
    );
  }
}
