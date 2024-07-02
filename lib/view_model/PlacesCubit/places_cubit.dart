import 'package:egy_travel/model/Home/PlacesModels/places_response.dart';
import 'package:egy_travel/repositories/places_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'places_state.dart';

class PlacesCubit extends Cubit<PlacesState> {
  final PlacesRepo _placesRepo;

  int _currentPage = 1;
  final List<PlacesData> _places = []; // Assuming 'Place' is your data model
  bool _isLastPage = false;

  PlacesCubit(this._placesRepo) : super(const PlacesState.initial());

  Future<void> getAllPlaces() async {
    emit(const PlacesState.getPlacesloading()); // Indicate initial loading

    final response =
        await _placesRepo.getAllPlaces(_currentPage); // Fetch initial page

    response.when(
      success: (placesResponseModel) {
        _places
            .addAll(placesResponseModel.data!.placesData!); // Update local list
        _currentPage++;
        _isLastPage =
            placesResponseModel.totalPages == _currentPage ? true : false;
        emit(PlacesState.getPlacesSuccess(_places, _isLastPage));
      },
      failure: (errorHandler) {
        emit(PlacesState.getPlacesError(errorHandler));
      },
    );
  }

  Future<void> loadMorePlaces() async {
    if (_isLastPage || state is GetPlacesloading)
      return; // Avoid unnecessary loads

    emit(const PlacesState.getPlacesloading()); // Indicate loading more

    final response =
        await _placesRepo.getAllPlaces(_currentPage); // Fetch next page

    response.when(
      success: (placesResponseModel) {
        _places.addAll(placesResponseModel.data!.placesData!);
        _currentPage++;
        _isLastPage =
            placesResponseModel.totalPages == _currentPage ? true : false;
        emit(PlacesState.getPlacesSuccess(_places, _isLastPage));
      },
      failure: (errorHandler) {
        emit(PlacesState.getPlacesError(errorHandler));
      },
    );
  }

  // Future<void> getRecommended(int id) async {
  //   emit(const PlacesState.getRecommendedloading()); // Indicate initial loading

  //   final response = await _placesRepo.getRecommended(id); // Fetch initial page

  //   response.when(
  //     success: (recommendedResponseModel) {
  //       emit(PlacesState.getRecommendedSuccess(
  //           recommendedResponseModel.recommendations));
  //     },
  //     failure: (errorHandler) {
  //       emit(PlacesState.getPlacesError(errorHandler));
  //     },
  //   );
  // }
}
