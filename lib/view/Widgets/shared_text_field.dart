import 'package:easy_localization/easy_localization.dart';
import 'package:egy_travel/res/app_regex.dart';
import 'package:egy_travel/res/colors_manager.dart';
import 'package:egy_travel/view/Widgets/password_validation.dart';
import 'package:egy_travel/view_model/LoginCubit/cubit/login_cubit.dart';
import 'package:egy_travel/view_model/ShowHidePassword/cubit/show_hide_password_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomPasswordField extends StatefulWidget {
  final String labelText;
  final Color enabledColor = ColorsManager.subTitle;
  final Color focusedColor = ColorsManager.secondPrimary;
  final Color errorColor = const Color.fromARGB(141, 244, 67, 54);
  // final Function(String?) validator;

  CustomPasswordField({
    super.key,
    required this.labelText,
    // required this.validator,
  });

  @override
  State<CustomPasswordField> createState() => _CustomPasswordFieldState();
}

class _CustomPasswordFieldState extends State<CustomPasswordField> {
  late TextEditingController controller;
  // bool haslowercase = false;
  // bool hasUppercase = false;
  // bool hasSpecialCharacters = false;
  // bool hasMinLength = false;
  // bool hasNumber = false;

  @override
  void initState() {
    super.initState();
    controller = context.read<LoginCubit>().passwordController;
    setupPasswordControllerListner();
  }

  void setupPasswordControllerListner() {
    controller.addListener(() {
      // haslowercase = AppRegex.hasLowerCase(controller.text);
      // hasUppercase = AppRegex.hasUpperCase(controller.text);
      // hasSpecialCharacters = AppRegex.hasSpecialCharacter(controller.text);
      // hasMinLength = AppRegex.hasMinLength(controller.text);
      // hasNumber = AppRegex.hasNumber(controller.text);
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShowHideCubit(),
      child: Padding(
        padding: const EdgeInsetsDirectional.only(top: 16.0),
        child: BlocBuilder<ShowHideCubit, ShowHideState>(
          builder: (context, state) {
            return Column(
              children: [
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "validPassword".tr();
                    }
                    return null;
                  },
                  obscureText: context.read<ShowHideCubit>().secure,
                  controller: controller,
                  decoration: InputDecoration(
                    labelText: widget.labelText,
                    labelStyle: TextStyle(
                        color: ColorsManager.secondPrimary.withOpacity(1)),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: widget.enabledColor.withOpacity(1),
                        width: 2.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: widget.focusedColor.withOpacity(1),
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: widget.errorColor.withOpacity(1),
                      ),
                    ),
                    suffixIcon: IconButton(
                      onPressed: () =>
                          context.read<ShowHideCubit>().showHideSwitch(),
                      icon: Icon(
                        context.read<ShowHideCubit>().secure
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                    ),
                  ),
                ),
                // PasswordValidation(
                //   haslowercase: haslowercase,
                //   hasUppercase: hasUppercase,
                //   hasSpecialCharacters: hasSpecialCharacters,
                //   hasMinLength: hasMinLength,
                //   hasNumber: hasNumber,
                // ),
              ],
            );
          },
        ),
      ),
    );
  }
}

//--------------------------------------------------------------------------

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String labelText;
  final Color enabledColor = ColorsManager.subTitle;
  final Color focusedColor = ColorsManager.secondPrimary;
  final Color errorColor = const Color.fromARGB(141, 244, 67, 54);
  CustomTextField({
    super.key,
    this.controller,
    required this.labelText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(
        top: 16.0,
      ),
      child: TextFormField(
        controller: context.read<LoginCubit>().emailController,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle:
              TextStyle(color: ColorsManager.secondPrimary.withOpacity(1)),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: enabledColor.withOpacity(1),
              width: 2.0,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: focusedColor.withOpacity(1),
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: errorColor.withOpacity(1),
            ),
          ),
        ),
        keyboardType: TextInputType.name,
        validator: (value) {
          if (value == null || value.isEmpty || !AppRegex.isEmailValid(value)) {
            return "ValidEmail".tr();
          }
          return null;
        },
      ),
    );
  }
}
