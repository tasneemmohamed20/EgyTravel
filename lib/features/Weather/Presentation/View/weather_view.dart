import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:egytraveler/Features/Weather/Presentation/Manager/FiveDaysForecastCubit/five_days_forecast_cubit.dart';
import 'package:egytraveler/Features/Weather/Presentation/View/Widgets/animated_dialog_container.dart';
import 'package:egytraveler/Features/Weather/Presentation/View/Widgets/weather_tab_item.dart';
import 'package:egytraveler/Features/Weather/Presentation/View/Widgets/weather_veiw_body.dart';
import 'package:egytraveler/Features/Weather/Presentation/View/Widgets/weather_view_header.dart';
import 'package:egytraveler/core/utils/styles.dart';

class WeatherView extends StatefulWidget {
  const WeatherView({super.key});

  @override
  State<WeatherView> createState() => _WeatherViewState();
}

class _WeatherViewState extends State<WeatherView>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 0; // Tracks the selected tab index
  late AnimationController
      controller; // Animation controller for tab animations
  late Animation<Offset> _animation1; // Animation for the hourly forecast tab
  late Animation<Offset> _animation2; // Animation for the weekly forecast tab

  @override
  void initState() {
    super.initState();
    //* Animation controller setup
    _animationController();
    //* Define animations
    _hourlyForecastAnimation();
    _weeklyForecastAnimation();
  }

  @override
  void dispose() {
    controller
        .dispose(); // Dispose the animation controller when the widget is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FiveDaysForecastCubit, FiveDaysForecastState>(
      builder: (context, state) {
        if (state is FiveDaysForecastInitial) {
          // Fetch the forecast data if it's in the initial state
          context.read<FiveDaysForecastCubit>().getFiveDaysForecast();
          return const Scaffold(
            body: Center(
              child:
                  CircularProgressIndicator(), // Show a loading indicator while fetching data
            ),
          );
        }
        if (state is FiveDaysForecastSuccess) {
          // Render the weather view if data fetch is successful
          return Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 80),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: WeatherViewHeader(
                        forecastModel: state.fiveDaysForecastResponse,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Row(
                      children: [
                        //* Tab 1: Hourly forecast
                        WeatherTabItem(
                          selectedIndex: _selectedIndex,
                          onTap: () {
                            _onTabTapped(0);
                          },
                          tapTitle: 'Hourly Forecast',
                          index: 0,
                        ),
                        const Spacer(),
                        //* Tab 2: Weekly Forecast
                        WeatherTabItem(
                          selectedIndex: _selectedIndex,
                          onTap: () {
                            _onTabTapped(1);
                          },
                          tapTitle: 'Weekly Forecast',
                          index: 1,
                        ),
                      ],
                    ),
                  ),
                  //* Weather content stack
                  WeatherVeiwBody(
                    selectedIndex: _selectedIndex,
                    animation1: _animation1,
                    animation2: _animation2,
                    forecastModel: state.fiveDaysForecastResponse,
                  ),
                  //* Animated container with weather data
                  AnimatedMetallicContainer(
                    weatherData: state.fiveDaysForecastResponse,
                  )
                ],
              ),
            ),
          );
        } else if (state is FiveDaysForecastFailed) {
          // Show an error message if data fetch fails
          return Scaffold(
            body: Center(
              child: Text(
                "Network error.\nPlease try again later",
                style: Styles.textRegular16,
                textAlign: TextAlign.center,
              ),
            ),
          );
        } else {
          return Container(); // Return an empty Container as a fallback
        }
      },
    );
  }

  // Define animation for the weekly forecast tab
  Animation<Offset> _weeklyForecastAnimation() {
    return _animation2 = Tween<Offset>(
      begin: const Offset(1.0, 0.0),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.easeInOut,
      ),
    );
  }

  // Define animation for the hourly forecast tab
  Animation<Offset> _hourlyForecastAnimation() {
    return _animation1 = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(-1.0, 0.0),
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.easeInOut,
      ),
    );
  }

  // Initialize the animation controller
  AnimationController _animationController() {
    return controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
  }

  // Handle tab selection and trigger animations
  void _onTabTapped(int index) {
    if (_selectedIndex != index) {
      setState(() {
        _selectedIndex = index;
      });
      //* Animate to the selected tab
      _selectedIndex == 0 ? controller.reverse() : controller.forward();
    }
  }
}
