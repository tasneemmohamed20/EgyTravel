import 'package:egy_travel/Data/Networking/api_error_handler.dart';
import 'package:egy_travel/Data/Networking/api_result.dart';
import 'package:egy_travel/Data/Networking/api_service.dart';
import 'package:egy_travel/model/ResetPassword/reset_request_body.dart';
import 'package:egy_travel/model/ResetPassword/reset_response.dart';

class ResetRepo {
  final ApiService _apiService;

  ResetRepo(this._apiService);

  Future<ApiResult<ResetResponseModel>> resetPassword(
      ResetRequestBody resetRequestBody) async {
    try {
      final response = await _apiService.resetPassword(resetRequestBody);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
}
