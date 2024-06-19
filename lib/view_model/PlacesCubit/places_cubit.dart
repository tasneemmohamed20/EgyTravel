import 'package:egy_travel/repositories/places_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'places_state.dart';

class PlacesCubit extends Cubit<PlacesState> {
  final PlacesRepo _placesRepo;
  PlacesCubit(this._placesRepo) : super(const PlacesState.initial());

  void getAllPlaces() async {
    emit(const PlacesState.getPlacesloading());
    final response = await _placesRepo.getAllPlaces();
    response.when(
      success: (placesResponseModel) {
        emit(PlacesState.getPlacesSuccess(placesResponseModel));
      },
      failure: (errorHandler) {
        emit(PlacesState.getPlacesError(errorHandler));
      },
    );
  }
}
