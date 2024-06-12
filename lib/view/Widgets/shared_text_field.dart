import 'package:egy_travel/res/colors_manager.dart';
import 'package:flutter/material.dart';

class CustomPasswordField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final Color borderColor;
  final bool Function(String)? validator;
  final bool isObscure;
  final VoidCallback? toggleObscure;

  const CustomPasswordField({
    super.key,
    required this.controller,
    required this.labelText,
    required this.borderColor,
    this.validator,
    this.isObscure = true,
    this.toggleObscure,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(top: 16.0),
      child: TextFormField(
        obscureText: isObscure,
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle:
              TextStyle(color: ColorsManager.secondPrimary.withOpacity(1)),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: borderColor.withOpacity(1),
              width: 2.0,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: borderColor.withOpacity(1),
            ),
          ),
          suffixIcon: IconButton(
            onPressed: toggleObscure,
            icon: Icon(
              isObscure ? Icons.visibility : Icons.visibility_off,
            ),
          ),
        ),
      ),
    );
  }
}

//--------------------------------------------------------------------------

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final Color borderColor;
  final TextStyle? labelStyle;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.labelText,
    required this.borderColor,
    this.labelStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(
        top: 16.0,
      ),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: labelStyle ??
              TextStyle(
                color: borderColor.withOpacity(1),
              ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: borderColor.withOpacity(1),
              width: 2.0,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: borderColor.withOpacity(1),
            ),
          ),
        ),
        keyboardType: TextInputType.name,
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please enter your Email';
          }
          return null;
        },
      ),
    );
  }
}
