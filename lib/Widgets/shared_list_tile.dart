import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final IconData? leadingIcon;
  final String? hint;
  final String title;
  final VoidCallback onTap;
  final Color elementsColor;

  const CustomListTile({
    super.key,
    this.hint,
    this.leadingIcon,
    required this.title,
    required this.onTap,
    required this.elementsColor,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: leadingIcon != null
          ? Icon(
              leadingIcon,
              size: 30,
              color: elementsColor,
            )
          : null,
      title: Text(
        title,
        style: TextStyle(
          color: elementsColor,
          fontSize: 24,
        ),
      ),
      subtitle: hint != null
          ? Text(
              hint!,
              style: TextStyle(
                overflow: TextOverflow.ellipsis,
                fontSize: 14,
                fontWeight: FontWeight.w300,
                color: elementsColor,
              ),
            )
          : null,
      onTap: onTap,
    );
  }
}
