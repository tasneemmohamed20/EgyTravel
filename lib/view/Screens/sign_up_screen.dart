// ignore_for_file: unused_local_variable

import 'package:easy_localization/easy_localization.dart';
import 'package:egy_travel/view/Screens/home_screen.dart';
import 'package:egy_travel/view/Widgets/shared_appbar.dart';
import 'package:egy_travel/view/Widgets/shared_button.dart';
import 'package:egy_travel/view/Widgets/shared_text_field.dart';
import 'package:egy_travel/res/app_assets.dart';
import 'package:egy_travel/res/colors_manager.dart';
import 'package:egy_travel/view_model/SignUpCubit/cubit.dart';
import 'package:egy_travel/view_model/SignUpCubit/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class SignUPScreen extends StatelessWidget {
  SignUPScreen({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: BlocProvider(
      create: (context) => SignUpCubit(),
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: ColorsManager.primary.withOpacity(1),
          appBar: CustomAppBar(
            enableBack: false,
            title: "SignUpTitle".tr(),
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
                                  "StartYourJourney".tr(),
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w700,
                                      color: ColorsManager.secondPrimary
                                          .withOpacity(1)),
                                ))),
                        CustomTextField(
                          borderColor: ColorsManager.secondPrimary,
                          controller: nameController,
                          labelText: "Name".tr(),
                        ),
                        const SizedBox(height: 16.0),
                        CustomTextField(
                          borderColor: ColorsManager.secondPrimary,
                          controller: emailController,
                          labelText: "Email".tr(),
                        ),
                        CustomTextField(
                          borderColor: ColorsManager.secondPrimary,
                          controller: addressController,
                          labelText: "Address".tr(),
                        ),
                        const SizedBox(height: 16.0),
                        CustomPasswordField(
                          borderColor: ColorsManager.secondPrimary,
                          controller: passwordController,
                          labelText: "Password".tr(),
                        ),
                        const SizedBox(height: 16.0),
                      ],
                    ),
                  ),
                  BlocConsumer<SignUpCubit, SignUpState>(
                    listener: (context, state) {
                      if (state is SignUpFailed) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: Align(
                                  alignment: AlignmentDirectional.centerStart,
                                  child: Text(state.message))),
                        );
                      } else if (state is SignUpSuccess) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Home()),
                        );
                      }
                    },
                    builder: (context, state) {
                      if (state is SignUpLoading) {
                        return const CircularProgressIndicator();
                      }
                      return CustomButton(
                        onPressed: () {
                          String email = emailController.text;
                          String password = passwordController.text;
                          String name = nameController.text;
                          String address = addressController.text;
                          context
                              .read<SignUpCubit>()
                              .signUp(email, password, name, address);
                        },
                        padding: EdgeInsetsDirectional.symmetric(
                            vertical: 16,
                            horizontal:
                                (MediaQuery.of(context).size.width * 0.3)),
                        backgroundColor:
                            ColorsManager.secondPrimary.withOpacity(1),
                        text: "CreateAccount".tr(),
                      );
                    },
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
                          "RememberMe".tr(),
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
          )),
    ));
  }
}
