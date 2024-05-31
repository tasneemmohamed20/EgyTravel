import 'package:egy_travel/res/app_assets.dart';
import 'package:egy_travel/res/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? leading;
  final String title;
  final TextStyle? titleTextStyle;
  final bool enableBack;

  const CustomAppBar({
    super.key,
    this.leading,
    required this.title,
    this.titleTextStyle,
    required this.enableBack,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: leading,
      automaticallyImplyLeading: enableBack,
      title: Text(
        title,
        style: titleTextStyle ??
            TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: ColorsManager.primary.withOpacity(1),
            ),
      ),
      centerTitle: true,
      backgroundColor: ColorsManager.secondPrimary.withOpacity(1),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

Widget backButton(BuildContext context) {
  return GestureDetector(
    onTap: () {
      Navigator.of(context).pop();
    },
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: SvgPicture.asset(
        Assets.backicon,
        height: 16,
        width: 16,
        fit: BoxFit.contain,
      ),
    ),
  );
}
