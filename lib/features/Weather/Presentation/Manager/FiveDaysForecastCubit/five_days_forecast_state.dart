part of 'five_days_forecast_cubit.dart';

@immutable
sealed class FiveDaysForecastState {}

final class FiveDaysForecastInitial extends FiveDaysForecastState {}

final class FiveDaysForecastLoading extends FiveDaysForecastState {}

final class FiveDaysForecastSuccess extends FiveDaysForecastState {
  final FiveDaysForecast fiveDaysForecastResponse;

  FiveDaysForecastSuccess({required this.fiveDaysForecastResponse});
}

final class FiveDaysForecastFailed extends FiveDaysForecastState {
  final String errorMessage;

  FiveDaysForecastFailed(this.errorMessage);
}
