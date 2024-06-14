import 'package:easy_localization/easy_localization.dart';
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
        title: 'ResetPassword'.tr(),
        enableBack: false,
        leading: backButton(context),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.symmetric(
                horizontal: 32.0, vertical: 32),
            child: Align(
              alignment: AlignmentDirectional.topStart,
              child: Text(
                "ResetPasswordCaption".tr(),
                softWrap: true,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: ColorsManager.secondPrimary.withOpacity(1)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.symmetric(horizontal: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomPasswordField(
                  // controller: currentPassword,
                  labelText: 'CurrentPassword'.tr(),
                  // borderColor: ColorsManager.secondPrimary.withOpacity(1)
                ),
                CustomPasswordField(
                  // controller: newPassword,
                  labelText: 'NewPassword'.tr(),
                  // borderColor: ColorsManager.secondPrimary.withOpacity(1),
                ),
                CustomPasswordField(
                  // controller: confirmPassword,
                  labelText: "ConfirmNewPassword".tr(),
                  // borderColor: ColorsManager.secondPrimary.withOpacity(1)
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(top: 32),
                  child: CustomButton(
                      onPressed: () {},
                      padding: const EdgeInsetsDirectional.symmetric(
                          horizontal: 128, vertical: 16),
                      backgroundColor:
                          ColorsManager.secondPrimary.withOpacity(1),
                      text: 'Save'.tr()),
                )
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
