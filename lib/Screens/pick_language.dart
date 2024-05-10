import 'dart:ui';

import 'package:egy_travel/Screens/OnBoarding/onboarding_view.dart';
import 'package:egy_travel/constants/app_assets.dart';
import 'package:egy_travel/constants/colors_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
      body: SafeArea(
        child: Center(
          child: Column(
              // mainAxisSize: MainAxisSize.m,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
                    style:
                        TextStyle(color: ColorsManager.subTitle, fontSize: 22)),
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
                          color: ColorsManager.secondPrimary,
                        )
                      : null, // Show checkmark if an item is selected
                  borderRadius: BorderRadius.circular(16),
                  underline: Container(
                    // Customize the underline of the dropdown button
                    height: 2,
                    color: ColorsManager.secondPrimary,
                  ),
                  dropdownColor: ColorsManager.primary.withOpacity(1),
                  items: <String>['Arabic', 'English'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              value,
                              // style: TextStyle(color: ColorsManager.subTitle),
                            ),
                            // if (value == selectedOption) Icon(Icons.check),
                          ]),
                    );
                  }).toList(),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.2,
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const OnBoardingView()),
                          (route) => false);
                    },
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          vertical: 8,
                          horizontal: 32,
                        ),
                        backgroundColor: ColorsManager.secondPrimary,
                        foregroundColor: Colors.grey.shade700,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32),
                        )),
                    child: Text(
                      'Let\'s go',
                      style: TextStyle(color: ColorsManager.subTitle),
                    )),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Text('You can change language any time in drawer.',
                      style: TextStyle(
                          color: ColorsManager.subTitle,
                          fontSize: 16,
                          fontWeight: FontWeight.w100)),
                ),
              ]),
        ),
      ),
    );
  }
}
