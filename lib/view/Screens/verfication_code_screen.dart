import 'package:easy_localization/easy_localization.dart';
import 'package:egy_travel/core/Di/dependency_injection.dart';
import 'package:egy_travel/model/ResetPassword/reset_request_body.dart';
import 'package:egy_travel/view/Widgets/reset_bloc_listener.dart';
import 'package:egy_travel/view/Widgets/shared_appbar.dart';
import 'package:egy_travel/view/Widgets/shared_button.dart';
import 'package:egy_travel/res/app_assets.dart';
import 'package:egy_travel/res/colors_manager.dart';
import 'package:egy_travel/view/Widgets/shared_text_field.dart';
import 'package:egy_travel/view_model/ForgotPassword/cubit/forgot_password_cubit.dart';
import 'package:egy_travel/view_model/ResetCubit/cubit/reset_password_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pinput/pinput.dart';

class VerficationCodeScreen extends StatelessWidget {
  const VerficationCodeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<ResetPasswordCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt<ForgotCubit>(),
        ),
      ],
      child: SafeArea(
        child: Scaffold(
            backgroundColor: ColorsManager.primary.withOpacity(1),
            resizeToAvoidBottomInset: false,
            appBar: CustomAppBar(
              title: "Verfication".tr(),
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
                          height: MediaQuery.of(context).size.height * 0.05,
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
                          alignment: AlignmentDirectional.topStart,
                          child: Text(
                            "VerficationCaption".tr(),
                            softWrap: true,
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
                                    bottom: BorderSide(
                                        color: ColorsManager.subTitle),
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
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 32),
                          child: Column(
                            children: [
                              const SizedBox(height: 6.0),
                              CustomPasswordField(
                                passwordController: context
                                    .read<ResetPasswordCubit>()
                                    .passwordController,
                                labelText: "Password".tr(),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Please enter a valid password';
                                  }
                                },
                              ),
                              const SizedBox(height: 6.0),
                              CustomPasswordField(
                                passwordController: context
                                    .read<ResetPasswordCubit>()
                                    .confirmPasswordController,
                                labelText: "ConfirmPassword".tr(),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Please enter a valid password';
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 32),
                          child: CustomButton(
                            onPressed: () {
                              context.read<ResetPasswordCubit>().emitResetState(
                                  ResetRequestBody(
                                      email: context
                                          .read<ForgotCubit>()
                                          .emailController
                                          .text,
                                      password: context
                                          .read<ResetPasswordCubit>()
                                          .passwordController
                                          .text,
                                      passwordConfirm: context
                                          .read<ResetPasswordCubit>()
                                          .confirmPasswordController
                                          .text,
                                      otp: context
                                          .read<ResetPasswordCubit>()
                                          .otpController
                                          .text));
                            },
                            padding: EdgeInsets.symmetric(
                                vertical: 16,
                                horizontal:
                                    (MediaQuery.of(context).size.width * 0.4)),
                            backgroundColor:
                                ColorsManager.secondPrimary.withOpacity(1),
                            text: 'Verify'.tr(),
                          ),
                        ),
                        const ResetBlocListener()
                      ],
                    ),
                  )
                ]);
              },
            )),
      ),
    );
  }
}
