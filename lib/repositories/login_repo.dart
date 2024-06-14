import 'package:egy_travel/Data/Networking/api_error_handler.dart';
import 'package:egy_travel/Data/Networking/api_result.dart';
import 'package:egy_travel/Data/Networking/api_service.dart';
import 'package:egy_travel/model/login_request_body.dart';
import 'package:egy_travel/model/login_response.dart';

class LoginRepo {
  final ApiService _apiService;

  LoginRepo(this._apiService);

  Future<ApiResult<LoginResponseModel>> login(
      LoginRequestBody loginRequestBody) async {
    try {
      final response = await _apiService.login(loginRequestBody);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
}
