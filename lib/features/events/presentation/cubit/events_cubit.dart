import 'package:bloc/bloc.dart';
import 'package:tech_tide/core/di/di.dart';
import 'package:tech_tide/core/entities/user_entity.dart';
import 'package:tech_tide/features/events/domain/entities/event_entity.dart';
import 'package:tech_tide/features/events/domain/repo/events_repo.dart';

part 'events_state.dart';

class EventsCubit extends Cubit<EventsState> {
  EventsCubit(this._eventRepository) : super(EventsInitial());

  final EventsRepository _eventRepository;

  late List<EventEntity> _events;

  List<EventEntity> get events => _events;

  Future<void> getEvents() async {
    emit(EventsLoading());
    final result = await _eventRepository.getEvents();
    result.fold(
      (failure) => emit(EventsError(failure.message)),
      (events) {
        _events = events;
        emit(EventsLoaded());
      },
    );
  }

  bool? isGoing;

  Future<void> toggleEventGoingStatus(String eventId, UserEntity user) async {
    final result = await _eventRepository.toggleEventGoingStatus(eventId);
    result.fold(
      (failure) => emit(ToggleEventGoingStatusError(failure.message)),
      (isGoing) {
        this.isGoing = isGoing;
        final event = events.firstWhere((event) => event.eventId == eventId);
        if (isGoing) {
          event.goingUsers.add(user);
        } else {
          event.goingUsers
              .removeWhere((eventUser) => eventUser.userId == user.userId);
        }
        emit(ToggleEventGoingStatusSuccess());
      },
    );
  }

  @override
  Future<void> close() {
    ServiceLocator.unregister<EventsCubit>();
    return super.close();
  }
}
