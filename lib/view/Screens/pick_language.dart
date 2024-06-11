import 'package:egy_travel/view/Screens/OnBoarding/onboarding_view.dart';
import 'package:egy_travel/view/Widgets/dropdown.dart';
import 'package:egy_travel/view/Widgets/shared_button.dart';
import 'package:egy_travel/res/app_assets.dart';
import 'package:egy_travel/res/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:egy_travel/res/const_functions.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PickLanguage extends StatefulWidget {
  const PickLanguage({super.key});

  @override
  State<PickLanguage> createState() => _PickLanguageState();
}

class _PickLanguageState extends State<PickLanguage> {
  final Future<SharedPreferences> _pref = SharedPreferences.getInstance();
  final String _onboarding = 'onBoarding';
  String? selectedOption;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.primary.withOpacity(1),
      body: SafeArea(
        child: Center(
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
            const Text('Select Your Language:',
                style: TextStyle(color: Colors.white70, fontSize: 22)),
            CustomDropdown(
                items: const ['Arabic', 'English'], hint: 'Pick Your Language'),
            // DropdownButton<String>(
            //   iconSize: MediaQuery.of(context).size.width * 0.1,
            //   hint: const Text(
            //     'Pick Your Language',
            //     style: TextStyle(color: Colors.white70),
            //   ),
            //   value: selectedOption,
            //   onChanged: (String? newValue) {
            //     setState(() {
            //       selectedOption = newValue;
            //     });
            //   },
            //   icon: selectedOption != null
            //       ? Icon(
            //           Icons.check,
            //           size: 24,
            //           color: ColorsManager.secondPrimary,
            //         )
            //       : null,
            //   borderRadius: BorderRadius.circular(16),
            //   underline: Container(
            //     height: 2,
            //     color: ColorsManager.secondPrimary,
            //   ),
            //   dropdownColor: ColorsManager.primary.withOpacity(1),
            //   items: <String>['Arabic', 'English'].map((String value) {
            //     return DropdownMenuItem<String>(
            //       value: value,
            //       child: Row(
            //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //           children: [
            //             Text(
            //               value,
            //             ),
            //           ]),
            //     );
            //   }).toList(),
            // ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
            ),
            CustomButton(
              onPressed: () async {
                SharedPreferences preferences = await _pref;
                await preferences.setBool(_onboarding, true);
                navigateFish(context, const OnBoardingView());
              },
              padding: const EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 32,
              ),
              backgroundColor: ColorsManager.secondPrimary.withOpacity(1),
              text: 'Let\'s go',
              foregroundColor: Colors.grey.shade700,
            ),
            const Padding(
              padding: EdgeInsets.only(top: 10),
              child: Text('You can change language any time in drawer.',
                  style: TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                      fontWeight: FontWeight.w100)),
            ),
          ]),
        ),
      ),
    );
  }
}
