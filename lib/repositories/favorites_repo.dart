import 'package:egy_travel/Data/Networking/api_error_handler.dart';
import 'package:egy_travel/Data/Networking/api_result.dart';
import 'package:egy_travel/Data/Networking/api_service.dart';
import 'package:egy_travel/model/Favorites/favorites_response.dart';

class FavRepo {
  final ApiService _apiService;

  FavRepo(this._apiService);

  Future<ApiResult<FavResponseModel>> favorites() async {
    try {
      final response = await _apiService.favorites();
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
}
