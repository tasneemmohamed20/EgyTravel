import 'package:egy_travel/Data/Networking/api_error_handler.dart';
import 'package:egy_travel/Data/Networking/api_result.dart';
import 'package:egy_travel/Data/Networking/api_service.dart';
import 'package:egy_travel/model/Favorites/articles/art_add_remove_response.dart';

class AddFavArtRepo {
  final ApiService _apiService;

  AddFavArtRepo(this._apiService);

  Future<ApiResult<ArtAddRemoveResponseModel>> addArt(String id) async {
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

  Future<ApiResult<ArtAddRemoveResponseModel>> removeArt(String id) async {
    try {
      final response = await _apiService.removeArt(id);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
}
