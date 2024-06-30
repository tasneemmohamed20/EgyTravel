import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

import 'package:egytraveler/Features/Weather/Data/Models/five_days_forecast/five_days_forecast.dart';
import 'package:egytraveler/Features/Weather/Presentation/View/Widgets/a_i_weather_feedback.dart';
import 'package:egytraveler/Features/Weather/Presentation/View/Widgets/refresh_feed_back_button.dart';
import 'package:egytraveler/core/utils/api_keys.dart';

class AnimatedMetallicContainer extends StatefulWidget {
  final FiveDaysForecast weatherData; // Weather data parameter

  const AnimatedMetallicContainer({super.key, required this.weatherData});

  @override
  State<AnimatedMetallicContainer> createState() =>
      _AnimatedMetallicContainerState();
}

class _AnimatedMetallicContainerState extends State<AnimatedMetallicContainer>
    with SingleTickerProviderStateMixin {
  final model = GenerativeModel(
      model: kGeminiModel,
      apiKey: kWeatherGeminiModelAPIKey); // Generative AI model

  late AnimationController _controller; // Animation controller
  String feedback = "Please wait a moment."; // Initial feedback message

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 20),
      vsync: this,
    )..repeat(reverse: true); // Repeat the animation

    generateWeatherFeedback(
        widget.weatherData); // Generate initial weather feedback
  }

  @override
  void dispose() {
    _controller.dispose(); // Dispose the animation controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Align(
            alignment: const FractionalOffset(1.1, 0.5),
            child: RefreshFeedBackButton(
              onTap: () {
                generateWeatherFeedback(widget
                    .weatherData); // Regenerate weather feedback on button tap
              },
            ),
          ),
          AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              // Define gradient colors with animation
              const kAnimatedMetallicContainerColors = [
                Color.fromARGB(255, 0, 107, 134),
                Color.fromARGB(255, 0, 74, 93),
                Color(0xff003441),
                Color.fromARGB(255, 0, 74, 93),
                Color.fromARGB(255, 0, 107, 134),
              ];
              return Container(
                margin: const EdgeInsets.all(12),
                padding: const EdgeInsets.all(12),
                width: 300,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.elliptical(20, 80),
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: kAnimatedMetallicContainerColors,
                    stops: [
                      0.0,
                      _controller.value * 0.25 + 0.25, // Animating the stops
                      _controller.value * 0.5 + 0.5, // Animating the stops
                      _controller.value * 0.75 + 0.75, // Animating the stops
                      1.0,
                    ],
                  ),
                ),
                child: AIWeatherFeedback(
                    feedback: feedback), // Display weather feedback
              );
            },
          ),
        ],
      ),
    );
  }

  Future<void> generateWeatherFeedback(FiveDaysForecast weatherData) async {
    feedback = "Please wait a moment."; // Display loading message

    final response = await model.generateContent([
      Content.text(
          "Shortly, can you tell me what to expect and be prepare for when going out if weather codition is: ${weatherData.current!.condition!.text} and temperature is ${weatherData.current!.tempC} degrees celcius"),
    ]); // Generate weather-related feedback using AI model

    if (response.text!.isNotEmpty) {
      setState(() {
        // Update the feedback message
        feedback = response.text.toString();
      });
    } else {
      setState(() {
        feedback =
            "No feedback received."; // Display message if no feedback is received
      });
    }
  }
}
