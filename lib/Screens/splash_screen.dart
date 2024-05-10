import 'package:egy_travel/Screens/pick_language.dart';
import 'package:flutter/material.dart';
import 'package:egy_travel/constants/colors_manager.dart';
import 'package:egy_travel/constants/app_assets.dart';

class SplashScreen extends StatefulWidget {
  // final Widget startWidget ;
  const SplashScreen({
    super.key,
    // required this.startWidget
  });

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> animation;

  late AnimationController animationController1;
  late Animation<Offset> animation1;

  @override
  void initState() {
    super.initState();
    initSlidingAnimation();
    initSlidingAnimation1();
    navigateToHome();
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
    animationController1.dispose();
  }

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

  void initSlidingAnimation() {
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1800));
    animation = Tween<Offset>(
      begin: const Offset(-2, 0),
      end: Offset.zero,
    ).animate(animationController);
    animationController.forward();
  }

  void initSlidingAnimation1() {
    animationController1 = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1800));
    animation1 = Tween<Offset>(
      begin: const Offset(0, 2),
      end: Offset.zero,
    ).animate(animationController1);
    animationController1.forward();
  }

  void navigateToHome() {
    Future.delayed(const Duration(seconds: 3), () {
      // navigateFish(context,widget.startWidget);
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const PickLanguage()),
          (route) => false);
    });
  }
}
