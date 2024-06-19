import 'package:egy_travel/Data/Networking/api_error_handler.dart';
import 'package:egy_travel/model/Home/places_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'places_state.freezed.dart';

@freezed
class PlacesState with _$PlacesState {
  const factory PlacesState.initial() = _Initial;

// Places
  const factory PlacesState.getPlacesloading() = GetPlacesloading;
  const factory PlacesState.getPlacesSuccess(
      PlacesResponseModel placesResponseModel) = GetPlacesSuccess;
  const factory PlacesState.getPlacesError(ErrorHandler errorHandler) =
      GetPlacesError;
}
