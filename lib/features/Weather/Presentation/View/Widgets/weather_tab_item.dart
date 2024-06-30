import 'package:flutter/material.dart';

import 'package:egytraveler/core/utils/color_manager.dart';
import 'package:egytraveler/core/utils/styles.dart';

class WeatherTabItem extends StatelessWidget {
  const WeatherTabItem({
    super.key,
    required this.selectedIndex,
    required this.onTap,
    required this.tapTitle,
    required this.index,
  });

  final int selectedIndex; // The currently selected tab index
  final void Function() onTap; // Callback function for when the tab is tapped
  final String tapTitle; // The title of the tab
  final int index; // The index of this tab

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // Trigger the onTap callback when the tab is tapped
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: selectedIndex == index
                  ? ColorManager
                      .kColorPrimary // Highlight the tab if it's selected
                  : Colors.transparent, // No border if not selected
              width: 2.0, // Border width
            ),
          ),
        ),
        padding: const EdgeInsets.symmetric(
            vertical: 10.0), // Padding for the container
        child: Text(
          tapTitle,
          style: Styles.textRegular14.copyWith(
            color: selectedIndex == index
                ? ColorManager
                    .kColorPrimary // Highlight the text if it's selected
                : Theme.of(context)
                    .iconTheme
                    .color, // Default color if not selected
          ),
        ),
      ),
    );
  }
}
