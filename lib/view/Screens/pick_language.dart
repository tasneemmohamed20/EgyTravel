import 'package:easy_localization/easy_localization.dart';
import 'package:egy_travel/view/Screens/OnBoarding/onboarding_view.dart';
import 'package:egy_travel/view/Widgets/dropdown.dart';
import 'package:egy_travel/view/Widgets/shared_button.dart';
import 'package:egy_travel/res/app_assets.dart';
import 'package:egy_travel/res/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:egy_travel/res/const_functions.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PickLanguage extends StatelessWidget {
  PickLanguage({super.key, this.selectedOption});

  final Future<SharedPreferences> _pref = SharedPreferences.getInstance();

  final String _onboarding = 'onBoarding';

  final String? selectedOption;

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
            Text(
              "WelcomeToEgyTravel".tr(),
              style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 28,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * (1 / 25),
            ),
            Text("SelectYourLanguage".tr(),
                style: const TextStyle(color: Colors.white70, fontSize: 22)),
            CustomDropdown(
                items: ["Arabic".tr(), "English".tr()], hint: "Languages".tr()),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
            ),
            CustomButton(
              onPressed: () async {
                SharedPreferences preferences = await _pref;
                await preferences.setBool(_onboarding, true);
                navigateFish(context, const OnBoardingView());
              },
              padding: const EdgeInsetsDirectional.symmetric(
                vertical: 8,
                horizontal: 32,
              ),
              backgroundColor: ColorsManager.secondPrimary.withOpacity(1),
              text: "LetsGo".tr(),
              foregroundColor: Colors.grey.shade700,
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(top: 10),
              child: Text("YoucanChangeYourLanguage".tr(),
                  style: const TextStyle(
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
