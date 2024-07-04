import 'package:egy_travel/Data/Networking/api_error_handler.dart';
import 'package:egy_travel/Data/Networking/api_result.dart';
import 'package:egy_travel/Data/Networking/api_service.dart';
import 'package:egy_travel/model/Home/ArticlesModels/articles_response.dart';

class ArticlesRepo{
  final ApiService _apiService;

  ArticlesRepo(this._apiService);

  Future<ApiResult<ArticlesResponseModel>> getAllArticles(String defaultLocal) async {
    try {

      final response = await _apiService.getAllArticles(defaultLocal);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
}
