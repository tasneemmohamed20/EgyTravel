// ignore_for_file: unused_local_variable

import 'package:egy_travel/Widgets/shared_appbar.dart';
import 'package:egy_travel/Widgets/shared_button.dart';
import 'package:egy_travel/Widgets/shared_text_field.dart';
import 'package:egy_travel/constants/app_assets.dart';
import 'package:egy_travel/constants/colors_manager.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SignUPScreen extends StatelessWidget {
  SignUPScreen({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: ColorsManager.primary.withOpacity(1),
            appBar: CustomAppBar(
              enableBack: false,
              title: 'Regestration',
              leading: backButton(context),
            ),
            body: Stack(
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
                                    'Sign up and start your journey with EgyTravel.',
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w700,
                                        color: ColorsManager.secondPrimary
                                            .withOpacity(1)),
                                  ))),
                          CustomTextField(
                            borderColor: ColorsManager.secondPrimary,
                            controller: nameController,
                            labelText: 'Name',
                          ),
                          const SizedBox(height: 16.0),
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
                        String name = nameController.text;
                      },
                      padding: EdgeInsets.symmetric(
                          vertical: 16,
                          horizontal:
                              (MediaQuery.of(context).size.width * 0.3)),
                      backgroundColor:
                          ColorsManager.secondPrimary.withOpacity(1),
                      text: 'Create account',
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
                  ],
                ),
              ],
            )));
  }
}
