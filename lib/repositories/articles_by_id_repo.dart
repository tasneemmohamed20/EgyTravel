import 'package:egy_travel/Data/Networking/api_error_handler.dart';
import 'package:egy_travel/Data/Networking/api_result.dart';
import 'package:egy_travel/Data/Networking/api_service.dart';
import 'package:egy_travel/model/Home/ArticlesModels/articles_by_id_response.dart';

class ArticlesByIdRepo {
  final ApiService _apiService;

  ArticlesByIdRepo(this._apiService);

  Future<ApiResult<ArticlesByIDResponseModel>> getArticlesById(
      String id) async {
    try {
      final response = await _apiService.articlesById(id);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
}
