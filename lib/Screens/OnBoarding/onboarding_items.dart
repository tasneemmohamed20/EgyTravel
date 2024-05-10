import 'package:egy_travel/Screens/OnBoarding/onboarding_info.dart';
import 'package:egy_travel/constants/app_assets.dart';
import 'package:flutter/material.dart';

class onBoardingItems {
  List<OnBoardingInfo> items = [
    OnBoardingInfo(
        title: 'Start exploring',
        descripton:
            'Are you ready to start exploring amazing places in Egypt let/’sget started',
        image: Image.asset(
          Assets.imagesOnboarding1,
          fit: BoxFit.cover,
        )),
    OnBoardingInfo(
        title: 'title',
        descripton: 'descripton',
        image: Image.asset(
          Assets.imagesOnboarding2,
          fit: BoxFit.cover,
        )),
    OnBoardingInfo(
      title: 'title',
      descripton: 'descripton',
      image: Image.asset(
        Assets.imagesOnboarding3,
        fit: BoxFit.cover,
      ),
    )
  ];
}
