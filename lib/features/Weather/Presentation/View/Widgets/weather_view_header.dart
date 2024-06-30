import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'package:egytraveler/Features/Weather/Data/Models/five_days_forecast/five_days_forecast.dart';
import 'package:egytraveler/Features/Weather/Presentation/Manager/Icons_function/get_icons.dart';
import 'package:egytraveler/core/utils/styles.dart';

class WeatherViewHeader extends StatelessWidget {
  const WeatherViewHeader({super.key, required this.forecastModel});

  final FiveDaysForecast
      forecastModel; // Forecast model containing weather data

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          MainAxisAlignment.spaceAround, // Space the children evenly
      children: [
        Column(
          children: [
            // Display the location name
            Text(
              forecastModel.location!.name.toString(),
              style: Styles.textBold18.copyWith(
                fontSize: 32,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            // Display the current temperature
            Text(
              "${forecastModel.current!.tempC!.toInt()}°",
              style: Styles.textBold18.copyWith(
                fontSize: 56,
              ),
            ),
          ],
        ),
        // Display the weather icon using Lottie animation
        SizedBox(
          width: 150,
          height: 150,
          child: Lottie.asset(
            getWeatherIcon(
              forecastModel.current!.condition!.text.toString(),
            ),
          ),
        ),
      ],
    );
  }
}
