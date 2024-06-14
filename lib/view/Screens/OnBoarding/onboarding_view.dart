import 'package:easy_localization/easy_localization.dart';
import 'package:egy_travel/Data/onboarding_info.dart';
import 'package:egy_travel/view/Screens/login_screen.dart';
import 'package:egy_travel/res/const_functions.dart';
import 'package:egy_travel/view/Widgets/shared_button.dart';
import 'package:egy_travel/res/colors_manager.dart';
import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  // final Future<SharedPreferences> _pref = SharedPreferences.getInstance();
  // final String _onboarding = 'onBoarding';
  final controller = OnBoardingItems();
  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorsManager.primary.withOpacity(1),
        body: Stack(
          children: [
            PageView.builder(
                itemCount: controller.items.length,
                controller: pageController,
                itemBuilder: (context, index) {
                  return Stack(
                    children: [
                      Center(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Container(
                            decoration: BoxDecoration(
                                color: ColorsManager.primary,
                                borderRadius: BorderRadius.circular(10)),
                            height: MediaQuery.of(context).size.height * 0.9,
                            width: MediaQuery.of(context).size.width * 0.9,
                            child: controller.items[index].image,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: MediaQuery.of(context).size.height * 0.29,
                        left: MediaQuery.of(context).size.width * 0.1,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Align(
                              alignment: AlignmentDirectional.topStart,
                              child: Text(
                                softWrap: true,
                                controller.items[index].title,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white70,
                                    fontSize:
                                        (MediaQuery.of(context).size.width *
                                                0.5) *
                                            0.15),
                              ),
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.02),
                            Align(
                              alignment: AlignmentDirectional.topStart,
                              child: Text(
                                softWrap: true,
                                controller.items[index].descripton,
                                maxLines: 3,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: ColorsManager.white,
                                    fontSize:
                                        (MediaQuery.of(context).size.width *
                                                0.5) *
                                            0.08),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                }),
            Positioned(
              bottom: MediaQuery.of(context).size.height * 0.05,
              left: 0,
              right: 0,
              child: Center(
                child: SmoothPageIndicator(
                  controller: pageController,
                  count: controller.items.length,
                  effect: JumpingDotEffect(
                      dotWidth: 12.0,
                      dotHeight: 12.0,
                      dotColor: ColorsManager.secondPrimary.withOpacity(1),
                      activeDotColor: ColorsManager.primary.withOpacity(1)),
                ),
              ),
            ),
            Positioned(
                bottom: MediaQuery.of(context).size.height * 0.09,
                left: 0,
                right: 0,
                child: Center(
                  child: CustomButton(
                    onPressed: () async {
                      // SharedPreferences preferences = await _pref;
                      // await preferences.setBool(_onboarding, true);
                      navigateFish(context, const LogInScreen());
                      // if (!mounted) return;
                    },
                    // onPressed: () => Navigator.push(
                    //       context,
                    //       MaterialPageRoute(
                    //           builder: (context) => const TestPage()),
                    //     ),
                    padding: EdgeInsetsDirectional.symmetric(
                      vertical: 8,
                      horizontal:
                          (MediaQuery.of(context).size.width / 344) * 100,
                    ),
                    backgroundColor: ColorsManager.secondPrimary,
                    text: "GetStarted".tr(),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
