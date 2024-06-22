import 'package:egy_travel/Data/Networking/api_error_handler.dart';
import 'package:egy_travel/Data/Networking/api_result.dart';
import 'package:egy_travel/Data/Networking/api_service.dart';
import 'package:egy_travel/model/ForgotPassword/forgot_request_body.dart';
import 'package:egy_travel/model/ForgotPassword/forgot_response.dart';

class ForgotRepo {
  final ApiService _apiService;

  ForgotRepo(this._apiService);

  Future<ApiResult<ForgotResponseModel>> forgot(
      ForgotRequestBody forgotRequestBody) async {
    try {
      final response = await _apiService.forgotPassword(forgotRequestBody);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
}
