import 'package:egy_travel/repositories/places_add_remove_repo.dart';
import 'package:egy_travel/view_model/PlacesAddRemove/cubit/add_remove_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddRemoveCubit extends Cubit<AddRemoveState> {
  final AddFavRepo _addFavRepo;
  final RemoveFavRepo _removeFavRepo;
  final AddTripRepo _addTripRepo;
  final RemoveTripRepo _removeTripRepo;

  AddRemoveCubit(this._addFavRepo, this._removeFavRepo, this._addTripRepo,
      this._removeTripRepo)
      : super(const AddRemoveState.initial());

  Future<void> addFav(String id) async {
    emit(const AddRemoveState.loading());
    final result = await _addFavRepo.addFav(id);
    result.when(
      success: (addRemoveResponseModel) =>
          emit(AddRemoveState.success(addRemoveResponseModel)),
      failure: (error) => emit(
          AddRemoveState.error(message: error.apiErrorModel.message ?? '')),
    );
  }

  Future<void> removeFav(String id) async {
    emit(const AddRemoveState.loading());
    final result = await _removeFavRepo.removeFav(id);
    result.when(
      success: (addRemoveResponseModel) =>
          emit(AddRemoveState.success(addRemoveResponseModel)),
      failure: (error) => emit(
          AddRemoveState.error(message: error.apiErrorModel.message ?? '')),
    );
  }

    Future<void> addTrip(String id) async {
    emit(const AddRemoveState.loading());
    final result = await _addTripRepo.addTrip(id);
    result.when(
      success: (addRemoveResponseModel) =>
          emit(AddRemoveState.success(addRemoveResponseModel)),
      failure: (error) => emit(
          AddRemoveState.error(message: error.apiErrorModel.message ?? '')),
    );
  }

    Future<void> removeTrip(String id) async {
    emit(const AddRemoveState.loading());
    final result = await _removeTripRepo.removeTrip(id);
    result.when(
      success: (addRemoveResponseModel) =>
          emit(AddRemoveState.success(addRemoveResponseModel)),
      failure: (error) => emit(
          AddRemoveState.error(message: error.apiErrorModel.message ?? '')),
    );
  }
}
