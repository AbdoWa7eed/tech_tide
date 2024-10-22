import 'package:tech_tide/core/utils/typedefs.dart';
import 'package:tech_tide/features/events/domain/entities/event_entity.dart';

abstract class EventsRepository {
  ResultFuture<List<EventEntity>> getEvents();
  ResultFuture<bool> toggleEventGoingStatus(String eventId);
}
