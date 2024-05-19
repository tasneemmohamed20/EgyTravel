import 'package:egy_travel/Screens/test_screen.dart';
import 'package:egy_travel/Widgets/shared_appbar.dart';
import 'package:egy_travel/Widgets/shared_button.dart';
import 'package:egy_travel/constants/app_assets.dart';
import 'package:egy_travel/constants/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pinput/pinput.dart';

class VerficationCodeScreen extends StatefulWidget {
  const VerficationCodeScreen({super.key});
  @override
  State<VerficationCodeScreen> createState() => _VerficationCodeScreenState();
}

class _VerficationCodeScreenState extends State<VerficationCodeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: ColorsManager.primary.withOpacity(1),
          resizeToAvoidBottomInset: false,
          appBar: CustomAppBar(
            title: "Verfication",
            enableBack: false,
            leading: backButton(context),
          ),
          body: Builder(
            builder: (context) {
              return Stack(children: [
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: MediaQuery.of(context).size.height * 0.02,
                  child: Opacity(
                    opacity: 0.3,
                    child: Image.asset(Assets.images4),
                  ),
                ),
                Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.1,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.15,
                            bottom: 16),
                        child: SvgPicture.asset(
                          Assets.otp,
                          height: MediaQuery.of(context).size.height * 0.15,
                          width: 64,
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Kindly input the code that was supplied to \nthe email address you registered.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color:
                                  ColorsManager.secondPrimary.withOpacity(1)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 32),
                        child: Pinput(
                          length: 4,
                          defaultPinTheme: PinTheme(
                              width: 56,
                              height: 56,
                              textStyle: TextStyle(
                                  fontSize: 20,
                                  color: ColorsManager.secondPrimary
                                      .withOpacity(1),
                                  fontWeight: FontWeight.w600),
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom:
                                      BorderSide(color: ColorsManager.subTitle),
                                ),
                              )),
                          focusedPinTheme: PinTheme(
                              width: 56,
                              height: 56,
                              textStyle: TextStyle(
                                  fontSize: 20,
                                  color: ColorsManager.secondPrimary
                                      .withOpacity(1),
                                  fontWeight: FontWeight.w600),
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                      color: ColorsManager.secondPrimary
                                          .withOpacity(1)),
                                ),
                              )),
                          submittedPinTheme: PinTheme(
                              width: 56,
                              height: 56,
                              textStyle: TextStyle(
                                  fontSize: 20,
                                  color: ColorsManager.secondPrimary
                                      .withOpacity(1),
                                  fontWeight: FontWeight.w600),
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                      color: ColorsManager.secondPrimary
                                          .withOpacity(1)),
                                ),
                              )),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 32),
                        child: CustomButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const TestPage()),
                            );
                          },
                          padding: EdgeInsets.symmetric(
                              vertical: 16,
                              horizontal:
                                  (MediaQuery.of(context).size.width * 0.4)),
                          backgroundColor:
                              ColorsManager.secondPrimary.withOpacity(1),
                          text: 'Verify',
                        ),
                      ),
                    ],
                  ),
                )
              ]);
            },
          )),
    );
  }
}
