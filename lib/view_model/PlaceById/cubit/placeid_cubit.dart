import 'package:bloc/bloc.dart';
import 'package:egy_travel/repositories/places_by_id_repo.dart';
import 'package:egy_travel/view_model/PlaceById/cubit/placeid_state.dart';

class PlaceByIdCubit extends Cubit<PlaceByIdState> {
  final PlacesByIdRepo _placeByIdRepo;

  PlaceByIdCubit(this._placeByIdRepo) : super(const PlaceByIdState.initial());
  Future<void> getPlaceById(String id) async {
    emit(const PlaceByIdState.loading());
    final result = await _placeByIdRepo.getPlacesById(id);
    result.when(
      success: (placesByIdResponse) =>
          emit(PlaceByIdState.success(placesByIdResponse)),
      failure: (error) => emit(
          PlaceByIdState.error(message: error.apiErrorModel.message ?? '')),
    );
  }
}
