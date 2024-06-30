import 'package:flutter/material.dart';

import 'package:egytraveler/core/utils/color_manager.dart';
import 'package:egytraveler/core/utils/styles.dart';

class RefreshFeedBackButton extends StatelessWidget {
  const RefreshFeedBackButton({
    super.key,
    required this.onTap,
  });

  final void Function() onTap; // Callback function when button is tapped

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onTap, // Assign the onTap function to the onPressed callback
      icon: Icon(
        Icons.refresh_outlined, // Icon displayed on the button
        color: Theme.of(context).iconTheme.color, // Icon color based on theme
      ),
      label: Text(
        "Refresh      ", // Text displayed beside the icon
        style: Styles.textRegular16.copyWith(
          color: Theme.of(context).iconTheme.color, // Text color based on theme
        ),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorManager.kColorPrimary, // Button background color
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30), // Button border radius
        ),
        padding: const EdgeInsets.all(8), // Button padding
      ),
    );
  }
}
