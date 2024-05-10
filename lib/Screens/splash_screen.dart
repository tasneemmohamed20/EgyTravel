import 'package:egy_travel/Screens/pick_language.dart';
import 'package:egy_travel/Screens/test_screen.dart';
import 'package:egy_travel/Shared/const_functions.dart';
import 'package:flutter/material.dart';
import 'package:egy_travel/constants/colors_manager.dart';
import 'package:egy_travel/constants/app_assets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  // final Widget startWidget ;
  const SplashScreen({
    super.key,
    // required this.startWidget
  });

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final Future<SharedPreferences> _pref = SharedPreferences.getInstance();
  final String _onboarding = 'onBoarding';
  // late AnimationController animationController;
  // late Animation<Offset> animation;
  // late AnimationController animationController1;
  // late Animation<Offset> animation1;

  @override
  void initState() {
    super.initState();
    // initSlidingAnimation();
    // initSlidingAnimation1();
    WidgetsBinding.instance.addPostFrameCallback((timestamp) async {
      await _checkIfUserSeenOnBoarding();
    });
  }

  _checkIfUserSeenOnBoarding() async {
    SharedPreferences _sharedPreferences = await _pref;
    bool? hasSeenOnBoarding = _sharedPreferences.getBool(_onboarding);
    if (hasSeenOnBoarding == null || hasSeenOnBoarding == false) {
      navigateToHome();
    } else {
      Future.delayed(const Duration(seconds: 2), () {
        navigateFish(context, const TestPage());
      });
      // navigateFish(context, const TestPage());
      // navigateToHome();
    }
  }

  // @override
  // void dispose() {
  //   super.dispose();
  //   animationController.dispose();
  //   animationController1.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorsManager.primary,
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(Assets.images4),
                const SizedBox(
                  height: 20,
                ),
                Image.asset(Assets.images6),
              ],
            ),
          ),
        ));
  }

  // void initSlidingAnimation() {
  //   animationController = AnimationController(
  //       vsync: this, duration: const Duration(milliseconds: 1800));
  //   animation = Tween<Offset>(
  //     begin: const Offset(-2, 0),
  //     end: Offset.zero,
  //   ).animate(animationController);
  //   animationController.forward();
  // }
  // void initSlidingAnimation1() {
  //   animationController1 = AnimationController(
  //       vsync: this, duration: const Duration(milliseconds: 1800));
  //   animation1 = Tween<Offset>(
  //     begin: const Offset(0, 2),
  //     end: Offset.zero,
  //   ).animate(animationController1);
  //   animationController1.forward();
  // }

  void navigateToHome() async {
    Future.delayed(const Duration(seconds: 2), () {
      navigateFish(context, const PickLanguage());
    });
  }
}
