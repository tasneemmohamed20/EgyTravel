import 'package:easy_localization/easy_localization.dart';
import 'package:egy_travel/view/Widgets/shared_appbar.dart';
import 'package:egy_travel/view/Widgets/shared_button.dart';
import 'package:egy_travel/res/app_assets.dart';
import 'package:egy_travel/res/colors_manager.dart';
import 'package:egy_travel/view/Widgets/SignUpWidgets/sign_up_bloc_listener.dart';
import 'package:egy_travel/view/Widgets/SignUpWidgets/sign_up_form.dart';
import 'package:egy_travel/view_model/SignUpCubit/sign_up_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUPScreen extends StatelessWidget {
  const SignUPScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: true,
            backgroundColor: ColorsManager.primary.withOpacity(1),
            appBar: CustomAppBar(
              enableBack: false,
              title: "SignUpTitle".tr(),
              leading: backButton(context),
            ),
            body: SingleChildScrollView(
              child: Stack(children: [
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
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 32),
                      child: SignUpForm(),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.symmetric(vertical: 8),
                      child: CustomButton(
                        onPressed: () {
                          validateThenDoSignup(context);
                        },
                        padding: EdgeInsetsDirectional.symmetric(
                            vertical: 16,
                            horizontal:
                                (MediaQuery.of(context).size.width * 0.2)),
                        backgroundColor:
                            ColorsManager.secondPrimary.withOpacity(1),
                        text: "CreateAccount".tr(),
                      ),
                    ),
                    const SignupBlocListener()
                  ],
                ),
              ]),
            )));
  }
}

void validateThenDoSignup(BuildContext context) {
  if (context.read<SignUpCubit>().formKey.currentState!.validate()) {
    context.read<SignUpCubit>().emitSignupStates();
  }
}
