import 'package:flutter/material.dart';
import 'package:egy_travel/core/utils/styles.dart';

class AIWeatherFeedback extends StatelessWidget {
  final String feedback; // Feedback parameter

  const AIWeatherFeedback({super.key, required this.feedback});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        feedback, // Display the feedback text
        style: Styles.textRegular16, // Apply text style
        textAlign: TextAlign.start, // Center-align the text
      ),
    );
  }
}
