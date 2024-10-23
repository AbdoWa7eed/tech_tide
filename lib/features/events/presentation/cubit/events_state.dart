part of 'events_cubit.dart';

sealed class EventsState {}

final class EventsInitial extends EventsState {}

final class EventsLoading extends EventsState {}

final class EventsLoaded extends EventsState {}

final class EventsError extends EventsState {
  final String message;
  EventsError(this.message);
}

final class ToggleEventGoingStatusSuccess extends EventsState {
  bool isGoing;
  ToggleEventGoingStatusSuccess(this.isGoing);
}

final class ToggleEventGoingStatusError extends EventsState {
  final String message;
  ToggleEventGoingStatusError(this.message);
}
