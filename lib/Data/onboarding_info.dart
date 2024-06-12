import 'package:easy_localization/easy_localization.dart';
import 'package:egy_travel/res/app_assets.dart';
import 'package:flutter/material.dart';

class OnBoardingInfo {
  final String title, descripton;
  final Image image;

  OnBoardingInfo(
      {required this.title, required this.descripton, required this.image});
}

class OnBoardingItems {
  List<OnBoardingInfo> items = [
    OnBoardingInfo(
        title: "titleOnBoarding1".tr(),
        descripton: "bodyOnBoarding1".tr(),
        image: Image.asset(
          Assets.imagesOnboarding1,
          fit: BoxFit.cover,
        )),
    OnBoardingInfo(
        title: "titleOnBoarding2".tr(),
        descripton: "bodyOnBoarding2".tr(),
        image: Image.asset(
          Assets.imagesOnboarding2,
          fit: BoxFit.cover,
        )),
    OnBoardingInfo(
      title: "titleOnBoarding3".tr(),
      descripton: "bodyOnBoarding3".tr(),
      image: Image.asset(
        Assets.imagesOnboarding3,
        fit: BoxFit.cover,
      ),
    )
  ];
}
