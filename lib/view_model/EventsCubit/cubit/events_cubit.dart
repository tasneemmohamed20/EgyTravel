import 'package:egy_travel/model/Home/events_response.dart';
import 'package:egy_travel/repositories/events_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'events_state.dart';

class EventsCubit extends Cubit<EventsState> {
  final EventsRepo _eventsRepo;
  EventsCubit(this._eventsRepo) : super(const EventsState.initial());

  void getAllEvents() async {
    emit(const EventsState.getEventsloading());
    final response = await _eventsRepo.getAllEvents();
    response.when(
      success: (EventsResponseModel eventsResponseModel) {
        emit(EventsState.getEventsSuccess(eventsResponseModel));
      },
      failure: (errorHandler) {
        emit(EventsState.getEventsError(errorHandler));
      },
    );
  }
}
