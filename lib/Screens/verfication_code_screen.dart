import 'package:egy_travel/Shared/shared_appbar.dart';
import 'package:egy_travel/constants/app_assets.dart';
import 'package:egy_travel/constants/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class VerficationCodeScreen extends StatefulWidget {
  const VerficationCodeScreen({super.key});
  @override
  State<VerficationCodeScreen> createState() => _VerficationCodeScreenState();
}

class _VerficationCodeScreenState extends State<VerficationCodeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorsManager.primary.withOpacity(1),
        resizeToAvoidBottomInset: false,
        appBar: CustomAppBar(
          title: "Forgot Password",
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
              // Column(
              //   mainAxisAlignment: MainAxisAlignment.start,
              //   crossAxisAlignment: CrossAxisAlignment.center,
              //   children: [
              //     Pinput(
              //         length: 4,
              //         defaultPinTheme: PinTheme(
              //           width: 56,
              //           height: 56,
              //           textStyle: TextStyle(
              //               fontSize: 20,
              //               color: Color.fromRGBO(30, 60, 87, 1),
              //               fontWeight: FontWeight.w600),
              //           decoration: BoxDecoration(
              //             border: Border.all(
              //                 color: Color.fromRGBO(234, 239, 243, 1)),
              //             borderRadius: BorderRadius.circular(20),
              //           ),
              //         ))
              //   ],
              // )
            ]);
          },
        ));
  }
}
