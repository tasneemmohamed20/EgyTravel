import 'package:dio/dio.dart';
import 'package:egy_travel/model/Home/events_response.dart';
import 'package:egy_travel/model/Home/articles_response.dart';
import 'package:egy_travel/model/Home/places_response.dart';
import 'package:egy_travel/model/Login/login_request_body.dart';
import 'package:egy_travel/model/Login/login_response.dart';
import 'package:egy_travel/model/ForgotPassword/forgot_request_body.dart';
import 'package:egy_travel/model/ForgotPassword/forgot_response.dart';
import 'package:egy_travel/model/Profile/ChangePassword/change_request_body.dart';
import 'package:egy_travel/model/Profile/ChangePassword/change_response.dart';
import 'package:egy_travel/model/Profile/DeleteAccount/delete_request_body.dart';
import 'package:egy_travel/model/Profile/DeleteAccount/delete_response.dart';
import 'package:egy_travel/model/Profile/EditProfile/edit_response.dart';
import 'package:egy_travel/model/Profile/get_profile_response.dart';
import 'package:egy_travel/model/ResetPassword/reset_request_body.dart';
import 'package:egy_travel/model/ResetPassword/reset_response.dart';
import 'package:egy_travel/model/SignUp/signup_request_body.dart';
import 'package:egy_travel/model/SignUp/signup_response.dart';
import 'package:egy_travel/res/string_manager.dart';
import 'package:retrofit/retrofit.dart';
part 'api_service.g.dart';

@RestApi(baseUrl: AppStrings.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST(AppStrings.signin)
  Future<LoginResponseModel> login(@Body() LoginRequestBody loginRequestBody);

  @POST(AppStrings.signup)
  Future<SignUpResponseModel> signup(
      @Body() SignUpRequestBody signupRequestBody);

  @GET(AppStrings.endPointGetAllPlaces)
  Future<PlacesResponseModel> getAllPlaces(
    @Query('page') int page,
    // @Query('lang') String defaultLocale,
  );

  @GET(AppStrings.endPointArticles)
  Future<ArticlesResponseModel> getAllArticles(
      // @Query('page') int page,
      // @Query('lang') String defaultLocale,
      );

  @POST(AppStrings.forgotPassword)
  Future<ForgotResponseModel> forgotPassword(
      @Body() ForgotRequestBody forgotRequestBody);

  @PUT(AppStrings.resetPassword)
  Future<ResetResponseModel> resetPassword(
      @Body() ResetRequestBody resetRequestBody);

  @GET(AppStrings.endPointGetAllEvent)
  Future<EventsResponseModel> getAllEvents();

  @GET(AppStrings.endPointUserData)
  Future<GetProfileResponseModel> getProfile();



  @PUT(AppStrings.endPointUpdatePassword)
  Future<ChangeResponseModel> changePassword(
      @Body() ChangeRequestBody changeRequestBody);

  @DELETE(AppStrings.endPointDeleteAccount)
  Future<DeleteResponseModel> deleteAccount(
      @Body() DeleteRequestBody deleteRequestBody);
}
