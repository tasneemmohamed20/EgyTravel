import 'package:egy_travel/Data/Networking/api_error_handler.dart';
import 'package:egy_travel/Data/Networking/api_result.dart';
import 'package:egy_travel/Data/Networking/api_service.dart';
import 'package:egy_travel/model/Recommended/recommended_response.dart';

class RecommendedRepo {
  final RecommendedService _recommendedService;

  RecommendedRepo(this._recommendedService);

  Future<ApiResult<RecommendationResponseModel>> getRecommended(int id) async {
    try {
      final response = await _recommendedService.recommended(id);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
}
