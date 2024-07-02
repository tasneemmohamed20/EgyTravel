import 'package:bloc/bloc.dart';
import 'package:egy_travel/Data/Networking/Errors/failure.dart';
import 'package:egy_travel/Features/Weather/Data/Models/five_days_forecast/five_days_forecast.dart';
import 'package:egy_travel/Features/Weather/Data/Repos/WeatherRepository/weather_service.dart';
import 'package:egy_travel/src/controllers/location_controller.dart';
import 'package:egy_travel/src/services/location_service.dart';
import 'package:meta/meta.dart';
import 'package:dartz/dartz.dart';

part 'five_days_forecast_state.dart';

class FiveDaysForecastCubit extends Cubit<FiveDaysForecastState> {
  final LocationService _locationService;
  final LocationController _locationController;

  FiveDaysForecastCubit(this._locationService, this._locationController)
      : super(FiveDaysForecastInitial());

  void getFiveDaysForecast() async {
    emit(FiveDaysForecastLoading());

    final locationData =
        await _locationService.getLocation(controller: _locationController);

    // if (locationData == null) {
    //   emit(FiveDaysForecastFailed('Location data not available'));
    //   return;
    // }

    // final Either<FailureE, FiveDaysForecast?> result = await CurrentWeatherRepo(
    //   locationData.latitude,
    //   locationData.longitude,
    // ).getFiveDaysForecast();

    // result.fold(
    //   (failure) {
    //     emit(FiveDaysForecastFailed(failure.errorMessage));
    //   },
    //   (forecastData) {
    //     emit(FiveDaysForecastSuccess(fiveDaysForecastResponse: forecastData!));
    //   },
    // );
  }
}
