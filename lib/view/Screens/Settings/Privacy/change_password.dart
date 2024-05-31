import 'package:egy_travel/view/Widgets/shared_appbar.dart';
import 'package:egy_travel/view/Widgets/shared_button.dart';
import 'package:egy_travel/view/Widgets/shared_text_field.dart';
import 'package:egy_travel/res/colors_manager.dart';
import 'package:flutter/material.dart';

class ChangePasswordScreen extends StatelessWidget {
  ChangePasswordScreen({super.key});
  final TextEditingController currentPassword = TextEditingController();
  final TextEditingController newPassword = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: ColorsManager.primary.withOpacity(1),
      appBar: CustomAppBar(
        title: 'Reset Password',
        enableBack: false,
        leading: backButton(context),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 32),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Create your new password for EgyTravel so you can login to your account',
                softWrap: true,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: ColorsManager.secondPrimary.withOpacity(1)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomPasswordField(
                    controller: currentPassword,
                    labelText: 'Current Password',
                    borderColor: ColorsManager.secondPrimary.withOpacity(1)),
                CustomPasswordField(
                    controller: newPassword,
                    labelText: 'New Password',
                    borderColor: ColorsManager.secondPrimary.withOpacity(1),
                    validator: validatePassword),
                CustomPasswordField(
                    controller: confirmPassword,
                    labelText: 'Confirm Password',
                    borderColor: ColorsManager.secondPrimary.withOpacity(1)),
                Padding(
                  padding: const EdgeInsets.only(top: 32),
                  child: CustomButton(
                      onPressed: () {},
                      padding: const EdgeInsets.symmetric(
                          horizontal: 128, vertical: 16),
                      backgroundColor:
                          ColorsManager.secondPrimary.withOpacity(1),
                      text: 'Save'),
                )
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
