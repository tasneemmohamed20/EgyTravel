
import 'package:egy_travel/Data/Networking/api_error_handler.dart';
import 'package:egy_travel/Data/Networking/api_result.dart';
import 'package:egy_travel/Data/Networking/api_service.dart';
import 'package:egy_travel/model/Home/places_response.dart';


class PlacesRepo {
  final ApiService _apiService;

  PlacesRepo(this._apiService);

  Future<ApiResult<PlacesResponseModel>> getAllPlaces() async {
    try {
      final response = await _apiService.getAllPlaces();
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
}
