import 'package:easy_localization/easy_localization.dart';
import 'package:egy_travel/res/app_regex.dart';
import 'package:egy_travel/res/colors_manager.dart';
import 'package:egy_travel/view/Widgets/password_validation.dart';
import 'package:egy_travel/view/Widgets/shared_text_field.dart';
import 'package:egy_travel/view_model/SignUpCubit/sign_up_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  SignUpFormState createState() => SignUpFormState();
}

class SignUpFormState extends State<SignUpForm> {
  bool hasLowercase = false;
  bool hasUppercase = false;
  bool hasSpecialCharacters = false;
  bool hasNumber = false;
  bool hasMinLength = false;

  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    passwordController = context.read<SignUpCubit>().passwordController;
    setupPasswordControllerListener();
  }

  void setupPasswordControllerListener() {
    passwordController.addListener(() {
      setState(() {
        hasLowercase = AppRegex.hasLowerCase(passwordController.text);
        hasUppercase = AppRegex.hasUpperCase(passwordController.text);
        hasSpecialCharacters =
            AppRegex.hasSpecialCharacter(passwordController.text);
        hasNumber = AppRegex.hasNumber(passwordController.text);
        hasMinLength = AppRegex.hasMinLength(passwordController.text);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<SignUpCubit>().formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 0, 8),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "StartYourJourney".tr(),
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        color: ColorsManager.secondPrimary.withOpacity(1)),
                  ))),
          CustomTextField(
              controller: context.read<SignUpCubit>().nameController,
              labelText: "Name".tr(),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter a valid name';
                }
              }),
          const SizedBox(height: 6.0),
          CustomTextField(
            controller: context.read<SignUpCubit>().emailController,
            labelText: "Email".tr(),
            validator: (value) {
              if (value.isEmpty || !AppRegex.isEmailValid(value)) {
                return 'Please enter a valid email';
              }
            },
          ),
          const SizedBox(height: 6.0),
          CustomTextField(
              controller: context.read<SignUpCubit>().addressController,
              labelText: "Address".tr(),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter a valid address';
                }
              }),
          const SizedBox(height: 6.0),
          CustomPasswordField(
            passwordController: context.read<SignUpCubit>().passwordController,
            labelText: "Password".tr(),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter a valid password';
              }
            },
          ),
          const SizedBox(height: 6.0),
          CustomPasswordField(
            passwordController:
                context.read<SignUpCubit>().passwordConfirmationController,
            labelText: "ConfirmPassword".tr(),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter a valid password';
              }
            },
          ),
          const SizedBox(height: 6.0),
          PasswordValidation(
            hasLowerCase: hasLowercase,
            hasUpperCase: hasUppercase,
            hasSpecialCharacters: hasSpecialCharacters,
            hasNumber: hasNumber,
            hasMinLength: hasMinLength,
          ),
        ],
      ),
    );
  }

  // @override
  // void dispose() {
  //   passwordController.dispose();
  //   super.dispose();
  // }
}
