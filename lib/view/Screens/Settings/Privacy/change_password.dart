import 'package:easy_localization/easy_localization.dart';
import 'package:egy_travel/model/Profile/ChangePassword/change_request_body.dart';
import 'package:egy_travel/view/Widgets/change_bloc_listener.dart';
import 'package:egy_travel/view/Widgets/shared_appbar.dart';
import 'package:egy_travel/view/Widgets/shared_button.dart';
import 'package:egy_travel/view/Widgets/shared_text_field.dart';
import 'package:egy_travel/res/colors_manager.dart';
import 'package:egy_travel/view_model/ChangePassword/cubit/change_password_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter a valid password';
                    }
                  },
                  passwordController: context
                      .read<ChangePasswordCubit>()
                      .currentpasswordController,
                  labelText: 'CurrentPassword'.tr(),
                ),
                CustomPasswordField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter a valid password';
                    }
                  },
                  passwordController:
                      context.read<ChangePasswordCubit>().newPasswordController,
                  labelText: 'NewPassword'.tr(),
                ),
                CustomPasswordField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter a valid password';
                    }
                  },
                  passwordController: context
                      .read<ChangePasswordCubit>()
                      .confirmPasswordController,
                  labelText: "ConfirmNewPassword".tr(),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(top: 32),
                  child: CustomButton(
                      onPressed: () => context
                          .read<ChangePasswordCubit>()
                          .emitChangeState(ChangeRequestBody(
                              currentPassword: context
                                  .read<ChangePasswordCubit>()
                                  .currentpasswordController
                                  .text,
                              confirmPassword: context
                                  .read<ChangePasswordCubit>()
                                  .confirmPasswordController
                                  .text,
                              newPassword: context
                                  .read<ChangePasswordCubit>()
                                  .newPasswordController
                                  .text)),
                      padding: const EdgeInsetsDirectional.symmetric(
                          horizontal: 128, vertical: 16),
                      backgroundColor:
                          ColorsManager.secondPrimary.withOpacity(1),
                      text: 'Save'.tr()),
                ),
                const ChangeBlocListener()
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
