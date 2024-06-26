import 'package:egy_travel/Data/Networking/api_error_handler.dart';
import 'package:egy_travel/Data/Networking/api_result.dart';
import 'package:egy_travel/Data/Networking/api_service.dart';
import 'package:egy_travel/model/Profile/ChangePassword/change_request_body.dart';
import 'package:egy_travel/model/Profile/ChangePassword/change_response.dart';

class ChangeRepo {
  final ApiService _apiService;

  ChangeRepo(this._apiService);

  Future<ApiResult<ChangeResponseModel>> changePassword(
      ChangeRequestBody changeRequestBody) async {
    try {
      final response = await _apiService.changePassword(changeRequestBody);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
}
