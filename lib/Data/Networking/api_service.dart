import 'package:dio/dio.dart';
import 'package:egy_travel/model/Favorites/articles/art_add_remove_response.dart';
import 'package:egy_travel/model/Favorites/places/add_remove_response.dart';
import 'package:egy_travel/model/Favorites/favorites_response.dart';
import 'package:egy_travel/model/Home/ArticlesModels/articles_by_id_response.dart';
import 'package:egy_travel/model/Home/PlacesModels/placesById_response.dart';
import 'package:egy_travel/model/Home/events_response.dart';
import 'package:egy_travel/model/Home/ArticlesModels/articles_response.dart';
import 'package:egy_travel/model/Home/PlacesModels/places_response.dart';
import 'package:egy_travel/model/Login/login_request_body.dart';
import 'package:egy_travel/model/Login/login_response.dart';
import 'package:egy_travel/model/ForgotPassword/forgot_request_body.dart';
import 'package:egy_travel/model/ForgotPassword/forgot_response.dart';
import 'package:egy_travel/model/Profile/ChangePassword/change_request_body.dart';
import 'package:egy_travel/model/Profile/ChangePassword/change_response.dart';
import 'package:egy_travel/model/Profile/DeleteAccount/delete_request_body.dart';
import 'package:egy_travel/model/Profile/DeleteAccount/delete_response.dart';
import 'package:egy_travel/model/Profile/get_profile_response.dart';
import 'package:egy_travel/model/Recommended/recommended_response.dart';
import 'package:egy_travel/model/ResetPassword/reset_request_body.dart';
import 'package:egy_travel/model/ResetPassword/reset_response.dart';
import 'package:egy_travel/model/Search/search_response.dart';
import 'package:egy_travel/model/SignUp/signup_request_body.dart';
import 'package:egy_travel/model/SignUp/signup_response.dart';
import 'package:egy_travel/res/string_manager.dart';
import 'package:retrofit/http.dart';
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

  @GET(AppStrings.endPointGetAllSearch)
  Future<SearchResponseModel> searchPlaces(
    @Query('search') String search,
    @Query('category') String category,
  );

  @GET(AppStrings.endPointGetFavorite)
  Future<FavResponseModel> favorites();

  @GET('${AppStrings.endPointGetAllPlaces}/{id}')
  Future<PlacesByIDResponseModel> placesById(
    @Path('id') String id,
  );

  @PUT(
      '${AppStrings.endPointGetAllPlaces}${'/'}${AppStrings.endPointGetFavorite}/{id}')
  Future<AddRemoveResponseModel> addFav(
    @Path('id') String id,
  );

  @DELETE(
      '${AppStrings.endPointGetAllPlaces}${'/'}${AppStrings.endPointGetFavorite}/{id}')
  Future<AddRemoveResponseModel> removeFav(
    @Path('id') String id,
  );
  @PUT(
      '${AppStrings.endPointGetAllPlaces}${'/'}${AppStrings.endPointUserTips}/{id}')
  Future<AddRemoveResponseModel> addTrip(
    @Path('id') String id,
  );
  @DELETE(
      '${AppStrings.endPointGetAllPlaces}${'/'}${AppStrings.endPointUserTips}/{id}')
  Future<AddRemoveResponseModel> removeTrip(
    @Path('id') String id,
  );

  @GET('${AppStrings.endPointArticles}/{id}')
  Future<ArticlesByIDResponseModel> articlesById(
    @Path('id') String id,
  );

  @PUT(
      '${AppStrings.endPointArticles}${'/'}${AppStrings.endPointGetFavorite}/{id}')
  Future<ArtAddRemoveResponseModel> addArt(
    @Path('id') String id,
  );
  @DELETE(
      '${AppStrings.endPointArticles}${'/'}${AppStrings.endPointGetFavorite}/{id}')
  Future<ArtAddRemoveResponseModel> removeArt(
    @Path('id') String id,
  );
}

@RestApi(baseUrl: AppStrings.baseUrlRecommended)
abstract class RecommendedService {
  factory RecommendedService(Dio dio, {String baseUrl}) = _RecommendedService;

  @GET("recommend/{id}")
  Future<RecommendationResponseModel> recommended(
    @Path('id') int id,
  );
}
