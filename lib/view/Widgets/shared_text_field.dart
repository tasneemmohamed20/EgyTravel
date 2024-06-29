import 'package:egy_travel/res/colors_manager.dart';
import 'package:egy_travel/view_model/ShowHidePassword/cubit/show_hide_password_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomPasswordField extends StatelessWidget {
  final TextEditingController passwordController;
  final String labelText;
  final Color enabledColor = ColorsManager.subTitle;
  final Color focusedColor = ColorsManager.secondPrimary;
  final Color errorColor = const Color.fromARGB(141, 244, 67, 54);
  final Function(String) validator;

  CustomPasswordField({
    super.key,
    required this.labelText,
    required this.passwordController,
    required this.validator,
  });

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
                    return validator(value!);
                  },
                  obscureText: context.read<ShowHideCubit>().secure,
                  controller: passwordController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.1),
                    labelText: labelText,
                    labelStyle: TextStyle(
                        color: ColorsManager.secondPrimary.withOpacity(1)),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(
                        color: enabledColor.withOpacity(1),
                        width: 2.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(
                        color: focusedColor.withOpacity(1),
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(
                        color: errorColor.withOpacity(1),
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
  final TextEditingController controller;
  final String labelText;
  final Color enabledColor = ColorsManager.subTitle;
  final Color focusedColor = ColorsManager.secondPrimary;
  final Color errorColor = const Color.fromARGB(141, 244, 67, 54);
  final Function(String) validator;

  CustomTextField({
    super.key,
    required this.controller,
    required this.labelText,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(
        top: 16.0,
      ),
      child: TextFormField(
        validator: (value) {
          return validator(value!);
        },
        controller: controller,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white.withOpacity(0.1),
          labelText: labelText,
          labelStyle:
              TextStyle(color: ColorsManager.secondPrimary.withOpacity(1)),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
              color: enabledColor.withOpacity(1),
              width: 2.0,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
              color: focusedColor.withOpacity(1),
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
              color: errorColor.withOpacity(1),
            ),
          ),
        ),
        keyboardType: TextInputType.name,
      ),
    );
  }
}
