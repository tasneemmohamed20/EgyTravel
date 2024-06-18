import 'package:egy_travel/res/colors_manager.dart';
import 'package:flutter/material.dart';

class PasswordValidation extends StatelessWidget {
  final bool hasLowerCase;
  final bool hasUpperCase;
  final bool hasSpecialCharacters;
  final bool hasMinLength;
  final bool hasNumber;

  const PasswordValidation(
      {super.key,
      required this.hasLowerCase,
      required this.hasUpperCase,
      required this.hasSpecialCharacters,
      required this.hasMinLength,
      required this.hasNumber});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildValidationRow("At least one lowercase letter", hasLowerCase),
        const SizedBox(height: 5),
        buildValidationRow("At least one uppercase letter", hasUpperCase),
        const SizedBox(height: 5),
        buildValidationRow("At least one number", hasNumber),
        const SizedBox(height: 5),
        buildValidationRow(
            "At least one special characther", hasSpecialCharacters),
        const SizedBox(height: 5),
        buildValidationRow("At least 8 character long", hasMinLength),
        const SizedBox(height: 5),
      ],
    );
  }

  Widget buildValidationRow(String text, bool hasValidated) {
    return Row(
      children: [
        CircleAvatar(
          radius: 2.5,
          backgroundColor: ColorsManager.secondPrimary.withOpacity(1),
        ),
        const SizedBox(width: 6),
        Text(
          text,
          style: TextStyle(
            color: hasValidated
                ? ColorsManager.secondPrimary.withOpacity(1)
                : ColorsManager.secondPrimary.withOpacity(1),
            fontSize: 12,
            fontWeight: FontWeight.w400,
            decoration: hasValidated ? TextDecoration.lineThrough : null,
            decorationThickness: 2,
          ),
        ),
      ],
    );
  }
}
