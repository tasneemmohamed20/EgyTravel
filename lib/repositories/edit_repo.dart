import 'package:egy_travel/Data/Networking/api_error_handler.dart';
import 'package:egy_travel/Data/Networking/api_result.dart';
import 'package:egy_travel/Data/Networking/api_service.dart';
import 'package:egy_travel/model/Profile/EditProfile/edit_request_body.dart';
import 'package:egy_travel/model/Profile/EditProfile/edit_response.dart';

class EditRepo {
  final ApiService _apiService;

  EditRepo(this._apiService);

  Future<ApiResult<EditResponseModel>> editProfile(
      EditRequestBody editRequestBody) async {
    try {
      final response = await _apiService.editProfile(editRequestBody);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
}
