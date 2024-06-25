import 'package:egy_travel/Data/Networking/api_error_handler.dart';
import 'package:egy_travel/Data/Networking/api_result.dart';
import 'package:egy_travel/Data/Networking/api_service.dart';
import 'package:egy_travel/model/Home/events_response.dart';

class EventsRepo {
  final ApiService _apiService;

  EventsRepo(this._apiService);

  Future<ApiResult<EventsResponseModel>> getAllEvents() async {
    try {
      final response = await _apiService.getAllEvents();
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
}
