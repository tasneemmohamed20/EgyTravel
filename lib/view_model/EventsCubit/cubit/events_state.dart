import 'package:egy_travel/Data/Networking/api_error_handler.dart';
import 'package:egy_travel/model/Home/events_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'events_state.freezed.dart';

@freezed
class EventsState with _$EventsState {
  const factory EventsState.initial() = _Initial;

  // Events
  const factory EventsState.getEventsloading() = GetEventsloading;
  const factory EventsState.getEventsSuccess(
      EventsResponseModel eventsResponseModel) = GetEventsSuccess;
  const factory EventsState.getEventsError(ErrorHandler errorHandler) =
      GetEventsError;
}
