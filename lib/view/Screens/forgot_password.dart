import 'package:easy_localization/easy_localization.dart';
import 'package:egy_travel/core/Di/dependency_injection.dart';
import 'package:egy_travel/model/ForgotPassword/forgot_request_body.dart';
import 'package:egy_travel/view/Widgets/forgot_bloc_listener.dart';
import 'package:egy_travel/view/Widgets/shared_appbar.dart';
import 'package:egy_travel/view/Widgets/shared_button.dart';
import 'package:egy_travel/view/Widgets/shared_text_field.dart';
import 'package:egy_travel/res/app_assets.dart';
import 'package:egy_travel/res/colors_manager.dart';
import 'package:egy_travel/view_model/ForgotPassword/cubit/forgot_password_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ForgotPassword extends StatelessWidget {
  ForgotPassword({super.key});
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ForgotCubit>(),
      child: SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: ColorsManager.primary.withOpacity(1),
            appBar: CustomAppBar(
              enableBack: false,
              title: "ForgotTitle".tr(),
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
                                padding:
                                    const EdgeInsets.fromLTRB(8, 16, 16, 32),
                                child: Column(
                                  children: [
                                    Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          "ForgotTitle2".tr(),
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w700,
                                              color: ColorsManager.secondPrimary
                                                  .withOpacity(1)),
                                        )),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "ForgotBody".tr(),
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: ColorsManager.secondPrimary),
                                      ),
                                    )
                                  ],
                                )),
                            CustomTextField(
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Please enter a valid password';
                                }
                              },
                              controller:
                                  context.read<ForgotCubit>().emailController,
                              labelText: 'Email'.tr(),
                            ),
                          ],
                        ),
                      ),
                      CustomButton(
                        onPressed: () {
                          context
                              .read<ForgotCubit>()
                              .emitForgotState(ForgotRequestBody(
                                email: context
                                    .read<ForgotCubit>()
                                    .emailController
                                    .text,
                              ));
                        },
                        padding: EdgeInsets.symmetric(
                            vertical: 16,
                            horizontal:
                                (MediaQuery.of(context).size.width * 0.4)),
                        backgroundColor:
                            ColorsManager.secondPrimary.withOpacity(1),
                        text: "Send".tr(),
                      ),
                    ],
                  ),
                  const ForgotBlocListener()
                ],
              );
            })),
      ),
    );
  }
}
