import 'package:egy_travel/core/helpers/constants.dart';
import 'package:egy_travel/view/Screens/pick_language.dart';
import 'package:egy_travel/res/const_functions.dart';
import 'package:egy_travel/view_model/profileCubit/cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:egy_travel/res/colors_manager.dart';
import 'package:egy_travel/res/app_assets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({
    super.key,
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
      context.read<ProfileCubit>().getProfile;
      await _checkIfUserSeenOnBoarding();
    });
  }

  _checkIfUserSeenOnBoarding() async {
    SharedPreferences sharedPreferences = await _pref;
    bool? hasSeenOnBoarding = sharedPreferences.getBool(_onboarding);
    if (hasSeenOnBoarding == null || hasSeenOnBoarding == false) {
      navigateToHome();
    } else {
      Future.delayed(const Duration(seconds: 2), () {
        _navigateToNextScreen();
      });
      // navigateFish(context, const TestPage());
      // navigateToHome();
    }
  }

  _navigateToNextScreen() async {
    // Simulate some initialization or loading process
    // await Future.delayed(const Duration(seconds: 3));
    // Here, replace isLoggedInUser with your actual logic to check if the user is logged in
    // bool isLoggedInUser = true; // Example condition
    if (isLoggedInUser == true) {
      context.read<ProfileCubit>().getProfile().then((value) {
        if (value == 'success') {
          Navigator.of(context).pushReplacementNamed('/primary');
        } else {
          Navigator.of(context).pushReplacementNamed('/login');
        }
      });
    } else {
      Navigator.of(context).pushReplacementNamed('/login');
    }
    // if (ProfileState is ProfileSuccess) {
    //   Navigator.of(context).pushReplacementNamed('/primary');
    // } else {
    //   Navigator.of(context).pushReplacementNamed('/login');
    // }

//     if (isLoggedInUser == true && ProfileState is ProfileSuccess) {
// Navigator.of(context).pushReplacementNamed('/primary');    }
// else {
//       navigateFish(context, PickLanguage());

//     }
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
        backgroundColor: ColorsManager.primary.withOpacity(1),
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
      navigateFish(context, PickLanguage());
    });
  }
}
