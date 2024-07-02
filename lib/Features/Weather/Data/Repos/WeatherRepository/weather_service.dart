import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:egy_travel/Data/Networking/Errors/failure.dart';
import 'package:egy_travel/Features/Weather/Data/Models/five_days_forecast/five_days_forecast.dart';
import 'package:egy_travel/core/utils/api_keys.dart';
import 'package:http/http.dart' as http;

class CurrentWeatherRepo {
  CurrentWeatherRepo(
    this.latitude,
    this.longitude,
  );

  final double? latitude;
  final double? longitude;

  Future<Either<FailureE, FiveDaysForecast?>> getFiveDaysForecast() async {
    try {
      var response = await http.get(Uri.parse(
          "https://api.weatherapi.com/v1/forecast.json?key=$kWeatherApiKey&q=$latitude,$longitude&days=7&aqi=yes&alerts=no"));

      if (response.statusCode == 200) {
        Map<String, dynamic> decodedResponse = json.decode(response.body);
        FiveDaysForecast fiveDaysForecastData =
            FiveDaysForecast.fromJson(decodedResponse);
        return right(fiveDaysForecastData);
      } else {
        // Handle HTTP errors using ServerFailure
        return left(ServerFailure(
            "Request failed with status code: ${response.statusCode}"));
      }
    } catch (error) {
      // Handle other exceptions using ServerFailure
      return left(ServerFailure("Error occurred: $error"));
    }
  }
}
