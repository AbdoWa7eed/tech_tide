import 'package:dartz/dartz.dart';
import 'package:tech_tide/core/network/error_handler.dart';
import 'package:tech_tide/core/utils/typedefs.dart';
import 'package:tech_tide/features/events/data/data_source/events_data_source.dart';
import 'package:tech_tide/features/events/data/mapper/mapper.dart';
import 'package:tech_tide/features/events/domain/entities/event_entity.dart';
import 'package:tech_tide/features/events/domain/repo/events_repo.dart';

class EventsRepositoryImpl implements EventsRepository {
  final EventsDataSource _eventDataSource;

  EventsRepositoryImpl(this._eventDataSource);

  @override
  ResultFuture<List<EventEntity>> getEvents() async {
    try {
      final response = await _eventDataSource.getEvents();
      final events = response.map((event) => event.toEntity()).toList();
      return Right(events);
    } catch (e) {
      return Left(ErrorHandler.handleException(e));
    }
  }

  @override
  ResultFuture<bool> toggleEventGoingStatus(String eventId) async {
    try {
      final isGoing = await _eventDataSource.toggleEventGoingStatus(eventId);
      return Right(isGoing);
    } catch (e) {
      return Left(ErrorHandler.handleException(e));
    }
  }
}
