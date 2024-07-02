import 'package:dio/dio.dart';
import 'package:egy_travel/Data/Networking/api_service.dart';
import 'package:egy_travel/Data/Networking/dio_factory.dart';
import 'package:egy_travel/repositories/article_add_remove_repo.dart';
import 'package:egy_travel/repositories/articles_by_id_repo.dart';
import 'package:egy_travel/repositories/places_add_remove_repo.dart';
import 'package:egy_travel/repositories/articles_repo.dart';
import 'package:egy_travel/repositories/change_password_repo.dart';
import 'package:egy_travel/repositories/delete_repo.dart';
import 'package:egy_travel/repositories/edit_repo.dart';
import 'package:egy_travel/repositories/events_repo.dart';
import 'package:egy_travel/repositories/favorites_repo.dart';
import 'package:egy_travel/repositories/get_profile_repo.dart';
import 'package:egy_travel/repositories/login_repo.dart';
import 'package:egy_travel/repositories/places_by_id_repo.dart';
import 'package:egy_travel/repositories/places_repo.dart';
import 'package:egy_travel/repositories/forgot_repo.dart';
import 'package:egy_travel/repositories/recommended_repo.dart';
import 'package:egy_travel/repositories/reset_repo.dart';
import 'package:egy_travel/repositories/search_repo.dart';
import 'package:egy_travel/repositories/signup_repo.dart';
import 'package:egy_travel/view_model/ArticlesAddRemove/cubit/art_add_remove_cubit.dart';
import 'package:egy_travel/view_model/PlacesAddRemove/cubit/add_remove_cubit.dart';
import 'package:egy_travel/view_model/AreticlesById/cubit/articles_by_id_cubit.dart';
import 'package:egy_travel/view_model/ArticlesCubit/cubit/articles_cubit.dart';
import 'package:egy_travel/view_model/ChangePassword/cubit/change_password_cubit.dart';
import 'package:egy_travel/view_model/DeleteCubit/cubit/delete_account_cubit.dart';
import 'package:egy_travel/view_model/EditProfile/cubit/edit_cubit.dart';
import 'package:egy_travel/view_model/EventsCubit/cubit/events_cubit.dart';
import 'package:egy_travel/view_model/FavCubit/cubit/favorites_cubit.dart';
import 'package:egy_travel/view_model/LoginCubit/cubit/login_cubit.dart';
import 'package:egy_travel/view_model/PlaceById/cubit/placeid_cubit.dart';
import 'package:egy_travel/view_model/PlacesCubit/places_cubit.dart';
import 'package:egy_travel/view_model/ForgotPassword/cubit/forgot_password_cubit.dart';
import 'package:egy_travel/view_model/RecommendedCubit/cubit/recommended_cubit.dart';
import 'package:egy_travel/view_model/ResetCubit/cubit/reset_password_cubit.dart';
import 'package:egy_travel/view_model/SearchCubit/cubit/search_cubit.dart';
import 'package:egy_travel/view_model/SignUpCubit/sign_up_cubit.dart';
import 'package:egy_travel/view_model/profileCubit/cubit/profile_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
// Dio & ApiService
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<Dio>(() => dio);
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));
  getIt
      .registerLazySingleton<RecommendedService>(() => RecommendedService(dio));

// Login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));

// signup
  getIt.registerLazySingleton<SignUpRepo>(() => SignUpRepo(getIt()));
  getIt.registerFactory<SignUpCubit>(() => SignUpCubit(getIt()));

// Places
  getIt.registerLazySingleton<PlacesRepo>(() => PlacesRepo(getIt()));
  getIt.registerFactory<PlacesCubit>(() => PlacesCubit(getIt()));

// Articles
  getIt.registerLazySingleton<ArticlesRepo>(() => ArticlesRepo(getIt()));
  getIt.registerFactory<ArticlesCubit>(() => ArticlesCubit(getIt()));

// Events
  getIt.registerLazySingleton<EventsRepo>(() => EventsRepo(getIt()));
  getIt.registerFactory<EventsCubit>(() => EventsCubit(getIt()));

// Frogot
  getIt.registerLazySingleton<ForgotRepo>(() => ForgotRepo(getIt()));
  getIt.registerLazySingleton<ForgotCubit>(() => ForgotCubit(getIt()));

// Reset
  getIt.registerLazySingleton<ResetRepo>(() => ResetRepo(getIt()));
  getIt.registerFactory<ResetPasswordCubit>(() => ResetPasswordCubit(getIt()));

// Profile
  getIt.registerLazySingleton<ProfileRepo>(() => ProfileRepo(getIt()));
  getIt.registerFactory<ProfileCubit>(() => ProfileCubit(getIt()));

// Edit
  getIt.registerLazySingleton<EditRepo>(() => EditRepo(getIt()));
  getIt.registerFactory<EditCubit>(() => EditCubit(getIt()));

// changePasswerd
  getIt.registerLazySingleton<ChangeRepo>(() => ChangeRepo(getIt()));
  getIt
      .registerFactory<ChangePasswordCubit>(() => ChangePasswordCubit(getIt()));

// deleteAccount
  getIt.registerLazySingleton<DeleteRepo>(() => DeleteRepo(getIt()));
  getIt.registerFactory<DeleteAccountCubit>(() => DeleteAccountCubit(getIt()));

// Search
  getIt.registerLazySingleton<SearchRepo>(() => SearchRepo(getIt()));
  getIt.registerLazySingleton<SearchCubit>(() => SearchCubit(getIt()));

// Favorites
  getIt.registerLazySingleton<FavRepo>(() => FavRepo(getIt()));
  getIt.registerFactory<FavCubit>(() => FavCubit(getIt()));

// Palces By Id
  getIt.registerLazySingleton<PlacesByIdRepo>(() => PlacesByIdRepo(getIt()));
  getIt.registerFactory<PlaceByIdCubit>(() => PlaceByIdCubit(getIt()));

// Articles By Id
  getIt
      .registerLazySingleton<ArticlesByIdRepo>(() => ArticlesByIdRepo(getIt()));
  getIt.registerFactory<ArticleByIdCubit>(() => ArticleByIdCubit(getIt()));

// Recommended
  getIt.registerLazySingleton<RecommendedRepo>(() => RecommendedRepo(getIt()));
  getIt.registerFactory<RecommendedCubit>(() => RecommendedCubit(getIt()));

// add/remove Fav & Trip
  getIt.registerLazySingleton<AddFavRepo>(() => AddFavRepo(getIt()));
  getIt.registerLazySingleton<RemoveFavRepo>(() => RemoveFavRepo(getIt()));
  getIt.registerLazySingleton<AddTripRepo>(() => AddTripRepo(getIt()));
  getIt.registerLazySingleton<RemoveTripRepo>(() => RemoveTripRepo(getIt()));
  getIt.registerFactory<AddRemoveCubit>(
      () => AddRemoveCubit(getIt(), getIt(), getIt(), getIt()));

// add/remove Articles
  getIt.registerLazySingleton<AddFavArtRepo>(() => AddFavArtRepo(getIt()));
  getIt
      .registerLazySingleton<RemoveFavArtRepo>(() => RemoveFavArtRepo(getIt()));
  getIt.registerFactory<ArtAddRemoveCubit>(
      () => ArtAddRemoveCubit(getIt(), getIt()));
}
