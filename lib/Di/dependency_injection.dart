import 'package:dio/dio.dart';
import 'package:egy_travel/Data/Networking/api_service.dart';
import 'package:egy_travel/Data/Networking/dio_factory.dart';
import 'package:egy_travel/repositories/login_repo.dart';
import 'package:egy_travel/view_model/LoginCubit/cubit/login_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
// Dio & ApiService
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));
// Login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));
}
