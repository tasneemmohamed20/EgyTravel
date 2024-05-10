import 'package:egy_travel/Screens/OnBoarding/onboarding_items.dart';
import 'package:egy_travel/constants/colors_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  final controller = onBoardingItems();
  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorsManager.primary,
        body: PageView.builder(
            itemCount: controller.items.length,
            controller: pageController,
            itemBuilder: (context, index) {
              return Stack(
                children: [
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                          color: ColorsManager.primary,
                          borderRadius: BorderRadius.circular(10)),
                      height: MediaQuery.of(context).size.height * 0.9,
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: controller.items[index].image,
                    ),
                  )
                ],
              );
            }),
      ),
    );
  }
}
