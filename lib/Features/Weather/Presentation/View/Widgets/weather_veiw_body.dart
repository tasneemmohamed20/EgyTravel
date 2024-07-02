import 'package:egy_travel/Features/Weather/Data/Models/five_days_forecast/five_days_forecast.dart';
import 'package:egy_travel/Features/Weather/Presentation/Manager/Time_manager/date_time_helper.dart';
import 'package:egy_travel/Features/Weather/Presentation/View/Widgets/small_weather_widget.dart';
import 'package:flutter/material.dart';

class WeatherVeiwBody extends StatelessWidget {
  const WeatherVeiwBody({
    super.key,
    required int selectedIndex,
    required Animation<Offset> animation1,
    required Animation<Offset> animation2,
    required this.forecastModel,
  })  : _selectedIndex = selectedIndex,
        _animation1 = animation1,
        _animation2 = animation2;

  final int _selectedIndex; // Index to track the selected tab
  final Animation<Offset> _animation1; // Animation for the first tab
  final Animation<Offset> _animation2; // Animation for the second tab
  final FiveDaysForecast
      forecastModel; // Forecast model containing weather data

  @override
  Widget build(BuildContext context) {
    // Initialize lists to store weather data
    final List<dynamic> dateTimeList = [];
    final List<int> currentHourTempList = [];
    final List<String> currentHourConditionList = [];

    // Loop to extract weather data for the next 24 hours
    for (int counter = 0; counter < 24; counter++) {
      int currentHourTemp =
          (forecastModel.forecast!.forecastday![0].hour![counter].tempC)!
              .toInt();
      currentHourTempList.add(currentHourTemp);

      dynamic dateTime =
          forecastModel.forecast!.forecastday![0].hour![counter].time;
      dateTimeList.add(dateTime);

      String currentHourCondition = (forecastModel
              .forecast!.forecastday![0].hour![counter].condition!.text)
          .toString();
      currentHourConditionList.add(currentHourCondition);
    }

    // Convert the dynamic list to a list of strings
    final List<String> dateHoursList = dateTimeList.cast<String>();

    // Get the next 7 hours using the function from date_time_helper.dart
    Map<String, Map<String, dynamic>> next7HoursWithValues =
        getNext7HoursWithValues(
            dateHoursList, currentHourTempList, currentHourConditionList);

    return Stack(
      children: [
        //* Tab 1 content: Hourly forecast
        AnimatedOpacity(
          opacity: _selectedIndex == 0
              ? 1.0
              : 0.0, // Show or hide based on selected index
          duration: const Duration(milliseconds: 500), // Animation duration
          child: SlideTransition(
            position: _animation1, // Slide animation for tab 1
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: SizedBox(
                height: 155,
                child: ListView.builder(
                  physics: const ClampingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount:
                      next7HoursWithValues.length, // Number of hours to display
                  itemBuilder: (BuildContext context, int index) {
                    String hour = next7HoursWithValues.keys.elementAt(index);
                    int temperature =
                        next7HoursWithValues[hour]!['value'] as int;
                    String condition =
                        next7HoursWithValues[hour]!['condition'] as String;

                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 4),
                      child: SmallWeatherWidget(
                        timeText: index == 0
                            ? 'Now'
                            : hour, // Display 'Now' for the first item
                        temp: temperature.toString(), // Display temperature
                        weather: condition, // Display weather condition
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ),
        //* Tab 2 content: Weekly Forecast
        AnimatedOpacity(
          opacity: _selectedIndex == 1
              ? 1.0
              : 0.0, // Show or hide based on selected index
          duration: const Duration(milliseconds: 500), // Animation duration
          child: SlideTransition(
            position: _animation2, // Slide animation for tab 2
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: SizedBox(
                height: 155,
                child: ListView.builder(
                  physics: const ClampingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: 7, // Number of days to display
                  itemBuilder: (BuildContext context, int index) {
                    String dateTime = forecastModel
                        .forecast!.forecastday![index].date
                        .toString();

                    String dateStatus =
                        getDateStatus(dateTime); // Get the day of the week

                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 4),
                      child: SmallWeatherWidget(
                        timeText: dateStatus, // Display day of the week
                        temp:
                            '${forecastModel.forecast!.forecastday![index].day!.maxtempC!.toInt()}', // Display max temperature
                        weather: forecastModel.forecast!.forecastday![index]
                            .day!.condition!.text!, // Display weather condition
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
