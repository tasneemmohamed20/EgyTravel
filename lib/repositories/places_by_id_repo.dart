import 'package:egy_travel/Data/Networking/api_error_handler.dart';
import 'package:egy_travel/Data/Networking/api_result.dart';
import 'package:egy_travel/Data/Networking/api_service.dart';
import 'package:egy_travel/model/Home/PlacesModels/placesById_response.dart';

class PlacesByIdRepo {
  final ApiService _apiService;

  PlacesByIdRepo(this._apiService);

  Future<ApiResult<PlacesByIDResponseModel>> getPlacesById(String id) async {
    try {
      final response = await _apiService.placesById(id);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
}
