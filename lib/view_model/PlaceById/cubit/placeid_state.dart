import 'package:egy_travel/model/Home/PlacesModels/placesById_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'placeid_state.freezed.dart';

@freezed
class PlaceByIdState with _$PlaceByIdState {
  const factory PlaceByIdState.initial() = _Initial;
  const factory PlaceByIdState.loading() = Loading;
  const factory PlaceByIdState.success(PlacesByIDResponseModel data) = Success;
  const factory PlaceByIdState.error({required String message}) = Error;
}
