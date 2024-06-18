import 'package:egy_travel/res/colors_manager.dart';
import 'package:flutter/material.dart';

class TestPage extends StatelessWidget {
  const TestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.primary.withOpacity(1),
      body: Center(
        child: Text(
          'Only for Test!',
          style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: ColorsManager.secondPrimary),
        ),
      ),
    );
  }
}



  
