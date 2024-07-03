import 'package:egy_travel/Data/Networking/api_error_handler.dart';
import 'package:egy_travel/Data/Networking/api_result.dart';
import 'package:egy_travel/Data/Networking/api_service.dart';

import '../model/Profile/get_profile_response.dart';

class AddFavArtRepo {
  final ApiService _apiService;

  AddFavArtRepo(this._apiService);

  Future<ApiResult<GetProfileResponseModel>> addArt(String id) async {
    try {
      final response = await _apiService.addArt(id);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
}

class RemoveFavArtRepo {
  final ApiService _apiService;

  RemoveFavArtRepo(this._apiService);

  Future<ApiResult<GetProfileResponseModel>> removeArt(String id) async {
    try {
      final response = await _apiService.removeArt(id);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
}
