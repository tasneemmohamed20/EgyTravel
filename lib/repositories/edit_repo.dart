import 'package:dio/dio.dart';
import 'package:egy_travel/Data/Networking/api_error_handler.dart';
import 'package:egy_travel/Data/Networking/api_result.dart';
import 'package:egy_travel/model/Profile/EditProfile/edit_response.dart';
import 'package:egy_travel/res/string_manager.dart';

class EditRepo {
  final Dio _dio;

  EditRepo(this._dio);

  Future<ApiResult<EditResponseModel>> editProfile({
    String? name,
    String? email,
    String? phone,
    MultipartFile? avatar,
    String? spareAvatar,
  }) async {
    try {
      var formData = FormData.fromMap({
        'name': name ?? '',
        'email': email ?? '',
        'phone': phone ?? '',
        if (avatar != null) 'avatar': avatar else 'avatar': spareAvatar,
      });

      var response = await _dio.put(
        AppStrings.baseUrl + AppStrings.endPointEditProfile,
        data: formData,
      );

      return ApiResult.success(EditResponseModel.fromJson(response.data));
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
}
