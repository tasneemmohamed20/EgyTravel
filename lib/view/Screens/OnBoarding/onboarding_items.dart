import 'package:egy_travel/view/Screens/OnBoarding/onboarding_info.dart';
import 'package:egy_travel/res/app_assets.dart';
import 'package:flutter/material.dart';

class OnBoardingItems {
  List<OnBoardingInfo> items = [
    OnBoardingInfo(
        title: 'Start exploring',
        descripton:
            'Are you ready to start exploring \namazing places in Egypt \nlet’s get started',
        image: Image.asset(
          Assets.imagesOnboarding1,
          fit: BoxFit.cover,
        )),
    OnBoardingInfo(
        title: 'Enjoy with offers and trips ',
        descripton:
            'see the best offers, hotels, reviews of \nthese places and the opinions\n of friends.',
        image: Image.asset(
          Assets.imagesOnboarding2,
          fit: BoxFit.cover,
        )),
    OnBoardingInfo(
      title: 'Share your Trip Details',
      descripton:
          'watch friends opinions, share travel \nexperiences with your friends and \nenjoy travels.',
      image: Image.asset(
        Assets.imagesOnboarding3,
        fit: BoxFit.cover,
      ),
    )
  ];
}
