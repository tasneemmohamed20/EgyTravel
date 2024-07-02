// Add Fav
import 'package:egy_travel/Data/Networking/api_error_handler.dart';
import 'package:egy_travel/Data/Networking/api_result.dart';
import 'package:egy_travel/Data/Networking/api_service.dart';
import 'package:egy_travel/model/Favorites/places/add_remove_response.dart';

class AddFavRepo {
  final ApiService _apiService;

  AddFavRepo(this._apiService);

  Future<ApiResult<AddRemoveResponseModel>> addFav(String id) async {
    try {
      final response = await _apiService.addFav(id);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
}

class RemoveFavRepo {
  final ApiService _apiService;

  RemoveFavRepo(this._apiService);

  Future<ApiResult<AddRemoveResponseModel>> removeFav(String id) async {
    try {
      final response = await _apiService.removeFav(id);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
}

class AddTripRepo {
  final ApiService _apiService;

  AddTripRepo(this._apiService);

  Future<ApiResult<AddRemoveResponseModel>> addTrip(String id) async {
    try {
      final response = await _apiService.addTrip(id);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
}

class RemoveTripRepo {
  final ApiService _apiService;

  RemoveTripRepo(this._apiService);

  Future<ApiResult<AddRemoveResponseModel>> removeTrip(String id) async {
    try {
      final response = await _apiService.removeTrip(id);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
}
