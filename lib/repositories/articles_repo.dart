import 'package:egy_travel/Data/Networking/api_error_handler.dart';
import 'package:egy_travel/Data/Networking/api_result.dart';
import 'package:egy_travel/Data/Networking/api_service.dart';
import 'package:egy_travel/model/Home/articles_response.dart';

class ArticlesRepo{
  final ApiService _apiService;

  ArticlesRepo(this._apiService);

  Future<ApiResult<ArticlesResponseModel>> getAllArticles() async {
    try {

      final response = await _apiService.getAllArticles(
      );
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
}
