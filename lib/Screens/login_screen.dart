// ignore_for_file: unused_local_variable

import 'package:egy_travel/Screens/forgot_password.dart';
import 'package:egy_travel/Screens/home_screen.dart';
import 'package:egy_travel/Screens/sign_up_screen.dart';
import 'package:egy_travel/Widgets/shared_appbar.dart';
import 'package:egy_travel/Widgets/shared_button.dart';
import 'package:egy_travel/Widgets/shared_text_field.dart';
import 'package:egy_travel/constants/app_assets.dart';
import 'package:egy_travel/constants/colors_manager.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class LogInScreen extends StatelessWidget {
  LogInScreen({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: ColorsManager.primary.withOpacity(1),
        appBar: const CustomAppBar(
          title: 'Login',
          enableBack: false,
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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 32),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                            padding: const EdgeInsets.fromLTRB(8, 0, 16, 32),
                            child: Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  'Login and start your journey with EgyTravel.',
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w700,
                                      color: ColorsManager.secondPrimary
                                          .withOpacity(1)),
                                ))),
                        CustomTextField(
                          borderColor: ColorsManager.secondPrimary,
                          controller: emailController,
                          labelText: 'Email Address',
                        ),
                        const SizedBox(height: 16.0),
                        CustomPasswordField(
                          borderColor: ColorsManager.secondPrimary,
                          controller: passwordController,
                          labelText: 'Password',
                          validator: validatePassword,
                        ),
                        const SizedBox(height: 16.0),
                      ],
                    ),
                  ),
                  CustomButton(
                    onPressed: () {
                      String email = emailController.text;
                      String password = passwordController.text;
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Home()),
                      );
                    },
                    padding: EdgeInsets.symmetric(
                        vertical: 16,
                        horizontal: (MediaQuery.of(context).size.width * 0.4)),
                    backgroundColor: ColorsManager.secondPrimary.withOpacity(1),
                    text: 'Login',
                  ),
                  Center(
                    child: TextButton(
                        child: Text(
                          'Forgot password?',
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: ColorsManager.secondPrimary,
                              fontWeight: FontWeight.w500),
                        ),
                        onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ForgotPassword()),
                            )),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.07),
                    child: Row(
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.check_box_rounded)),
                        Text(
                          'Remember me',
                          style: TextStyle(
                              color: ColorsManager.secondPrimary,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                  const Spacer(),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    const Text('You don’t have an account?'),
                    TextButton(
                      child: Text(
                        'Sign up',
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: ColorsManager.secondPrimary,
                            fontWeight: FontWeight.w500),
                      ),
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignUPScreen()),
                      ),
                    ),
                  ])
                ],
              ),
            ],
          );
        }),
      ),
    );
  }
}
