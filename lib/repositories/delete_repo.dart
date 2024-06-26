import 'package:egy_travel/Data/Networking/api_error_handler.dart';
import 'package:egy_travel/Data/Networking/api_result.dart';
import 'package:egy_travel/Data/Networking/api_service.dart';
import 'package:egy_travel/model/Profile/DeleteAccount/delete_request_body.dart';
import 'package:egy_travel/model/Profile/DeleteAccount/delete_response.dart';

class DeleteRepo {
  final ApiService _apiService;

  DeleteRepo(this._apiService);

  Future<ApiResult<DeleteResponseModel>> deleteAccount(
      DeleteRequestBody deleteRequestBody) async {
    try {
      final response = await _apiService.deleteAccount(deleteRequestBody);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
}
