import 'package:egy_travel/Screens/verfication_code_screen.dart';
import 'package:egy_travel/Shared/shared_appbar.dart';
import 'package:egy_travel/Shared/shared_button.dart';
import 'package:egy_travel/Shared/shared_text_field.dart';
import 'package:egy_travel/constants/app_assets.dart';
import 'package:egy_travel/constants/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ForgotPassword extends StatelessWidget {
  ForgotPassword({super.key});
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: ColorsManager.primary.withOpacity(1),
        appBar: CustomAppBar(
          enableBack: false,
          title: 'Forgot Password',
          leading: backButton(context),
        ),
        body: Builder(builder: (context) {
          return Stack(
            children: [
              Positioned(
                left: 0,
                right: 0,
                bottom: MediaQuery.of(context).size.height * 0.02,
                child: Opacity(
                  opacity: 0.3,
                  child: Image.asset(Assets.images4),
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                      MediaQuery.of(context).size.width * 0.035,
                      MediaQuery.of(context).size.height * 0.15,
                      MediaQuery.of(context).size.width * 0.035,
                      MediaQuery.of(context).size.height * 0.015,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        SvgPicture.asset(Assets.lock),
                        Padding(
                            padding: const EdgeInsets.fromLTRB(8, 16, 16, 32),
                            child: Column(
                              children: [
                                Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      'Forgot your password?',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w700,
                                          color: ColorsManager.secondPrimary
                                              .withOpacity(1)),
                                    )),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Enter your registered Email below to receive \npassword reset code',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: ColorsManager.secondPrimary),
                                  ),
                                )
                              ],
                            )),
                        CustomTextField(
                          borderColor: ColorsManager.secondPrimary,
                          controller: emailController,
                          labelText: 'Email Address',
                        ),
                      ],
                    ),
                  ),
                  CustomButton(
                    onPressed: () {
                      String email = emailController.text;
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const VerficationCodeScreen()),
                      );
                    },
                    padding: EdgeInsets.symmetric(
                        vertical: 16,
                        horizontal: (MediaQuery.of(context).size.width * 0.4)),
                    backgroundColor: ColorsManager.secondPrimary.withOpacity(1),
                    text: 'Send',
                  ),
                ],
              ),
            ],
          );
        }));
  }
}
