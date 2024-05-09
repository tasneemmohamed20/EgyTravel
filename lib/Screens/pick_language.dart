import 'dart:ui';

import 'package:egy_travel/constants/app_assets.dart';
import 'package:egy_travel/constants/colors_manager.dart';
import 'package:flutter/material.dart';

class PickLanguage extends StatefulWidget {
  const PickLanguage({super.key});

  @override
  State<PickLanguage> createState() => _PickLanguageState();
}

class _PickLanguageState extends State<PickLanguage> {
  String? selectedOption;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.primary,
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image.asset(Assets.images6),
          SizedBox(
            height: MediaQuery.of(context).size.height * (1 / 40),
          ),
          const Text(
            'Welcome to EgyTravel',
            style: TextStyle(
                color: Colors.white70,
                fontSize: 28,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * (1 / 25),
          ),
          Text('Select Your Language:',
              style: TextStyle(color: ColorsManager.subTitle, fontSize: 22)),
          DropdownButton<String>(
            iconSize: MediaQuery.of(context).size.width * 0.1,
            hint: Text(
              'Pick Your Language',
              style: TextStyle(color: ColorsManager.subTitle),
            ),
            value: selectedOption,
            onChanged: (String? newValue) {
              setState(() {
                selectedOption = newValue;
              });
            },
            icon: selectedOption != null
                ? Icon(
                    Icons.check,
                    size: 24,
                    color: Colors.white70,
                  )
                : null, // Show checkmark if an item is selected
            items: <String>['Arabic', 'English'].map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(value),
                      // if (value == selectedOption) Icon(Icons.check),
                    ]),
              );
            }).toList(),
          )
          // ElevatedButton(
          //   onPressed: (){},
          //   child: )
        ]),
      ),
    );
  }
}
