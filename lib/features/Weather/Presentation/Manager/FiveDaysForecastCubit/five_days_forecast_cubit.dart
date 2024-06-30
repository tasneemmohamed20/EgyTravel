import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:dartz/dartz.dart';

import 'package:egytraveler/core/Errors/failure.dart';
import 'package:egytraveler/Features/Weather/Data/Models/five_days_forecast/five_days_forecast.dart';
import 'package:egytraveler/Features/Weather/Data/Repos/Repositories/weather_service.dart';
import 'package:egytraveler/core/layout/homeLayout/Presentation/Manager/HomeLayoutCubit/cubit.dart';

part 'five_days_forecast_state.dart';

class FiveDaysForecastCubit extends Cubit<FiveDaysForecastState> {
  final HomeCubit homeCubit;

  FiveDaysForecastCubit(this.homeCubit) : super(FiveDaysForecastInitial());

  void getFiveDaysForecast() async {
    final locationData = homeCubit.locationData;

    if (locationData == null) {
      emit(FiveDaysForecastFailed('Location data not available'));
      return;
    }

    final Either<Failure, FiveDaysForecast?> result = await CurrentWeatherRepo(
      locationData.latitude,
      locationData.longitude,
    ).getFiveDaysForecast();

    result.fold(
      (failure) {
        emit(FiveDaysForecastFailed(failure.errorMessage));
      },
      (forecastData) {
        emit(FiveDaysForecastSuccess(fiveDaysForecastResponse: forecastData!));
      },
    );
  }
}
