import 'package:dio/dio.dart';
import 'package:egy_travel/Data/Networking/api_service.dart';
import 'package:egy_travel/Data/Networking/dio_factory.dart';
import 'package:egy_travel/repositories/articles_repo.dart';
import 'package:egy_travel/repositories/edit_repo.dart';
import 'package:egy_travel/repositories/events_repo.dart';
import 'package:egy_travel/repositories/get_profile_repo.dart';
import 'package:egy_travel/repositories/login_repo.dart';
import 'package:egy_travel/repositories/places_repo.dart';
import 'package:egy_travel/repositories/forgot_repo.dart';
import 'package:egy_travel/repositories/reset_repo.dart';
import 'package:egy_travel/repositories/signup_repo.dart';
import 'package:egy_travel/view_model/ArticlesCubit/cubit/articles_cubit.dart';
import 'package:egy_travel/view_model/EditProfile/cubit/edit_cubit.dart';
import 'package:egy_travel/view_model/EventsCubit/cubit/events_cubit.dart';
import 'package:egy_travel/view_model/LoginCubit/cubit/login_cubit.dart';
import 'package:egy_travel/view_model/PlacesCubit/places_cubit.dart';
import 'package:egy_travel/view_model/ForgotPassword/cubit/forgot_password_cubit.dart';
import 'package:egy_travel/view_model/ResetCubit/cubit/reset_password_cubit.dart';
import 'package:egy_travel/view_model/SignUpCubit/sign_up_cubit.dart';
import 'package:egy_travel/view_model/UserDataCubit/cubit/profile_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
// Dio & ApiService
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

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
}
