import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'package:egytraveler/Features/Weather/Presentation/Manager/Icons_function/get_icons.dart';
import 'package:egytraveler/core/utils/color_manager.dart';
import 'package:egytraveler/core/utils/styles.dart';

class SmallWeatherWidget extends StatelessWidget {
  const SmallWeatherWidget({
    super.key,
    required this.timeText,
    required this.temp,
    required this.weather,
  });

  final String timeText; // The time to display (e.g., 'Now', '12:00 PM')
  final String temp; // The temperature to display
  final String
      weather; // The weather condition to display (used to get the correct icon)

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140, // Height of the weather widget
      width: 60, // Width of the weather widget
      decoration: ShapeDecoration(
        shadows: const [
          BoxShadow(
            color: Colors.black38, // Shadow color
            blurRadius: 3, // Amount of blur
            spreadRadius: 1, // Amount of spread
            blurStyle: BlurStyle.normal, // Blur style
          ),
        ],
        gradient: LinearGradient(
          colors: [
            ColorManager.kDarkColorBackground, // Start color of the gradient
            ColorManager.kDarkColorBackgroundLight, // End color of the gradient
          ],
          begin: Alignment.bottomLeft, // Start point of the gradient
          end: Alignment.centerRight, // End point of the gradient
        ),
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(40), // Rounded corners with radius of 40
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: 10, vertical: 15), // Padding inside the container
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center, // Center the content vertically
          crossAxisAlignment:
              CrossAxisAlignment.center, // Center the content horizontally
          mainAxisSize: MainAxisSize.min, // Minimize the main axis size
          children: [
            Text(
              timeText, // Display the time text
              style: Styles.textRegular12, // Style for the time text
            ),
            const SizedBox(height: 15), // Spacer
            SizedBox(
              height: 32, // Height of the weather icon
              width: 32, // Width of the weather icon
              child: Lottie.asset(
                  getWeatherIcon(weather)), // Display the weather icon
            ),
            const SizedBox(height: 15), // Spacer
            Text("$temp°",
                style: Styles.textRegular16) // Display the temperature
          ],
        ),
      ),
    );
  }
}
