import 'package:flutter/material.dart';
import 'package:egy_travel/constants/colors_manager.dart';

class CustomSliverAppBar extends StatelessWidget {
  final String title;
  final IconData leadingIcon;
  final VoidCallback onLeadingPressed;
  final String? backgroundImageUrl;
  final double expandedHeight;

  const CustomSliverAppBar({
    super.key,
    required this.title,
    required this.leadingIcon,
    required this.onLeadingPressed,
    this.backgroundImageUrl,
    required this.expandedHeight,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: expandedHeight,
      floating: true,
      snap: true,
      backgroundColor: ColorsManager.secondPrimary.withOpacity(1),
      pinned: false,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          title,
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: ColorsManager.primary.withOpacity(1),
          ),
        ),
        background: backgroundImageUrl != null
            ? Image.network(
                backgroundImageUrl!,
                fit: BoxFit.cover,
              )
            : Container(
                color: ColorsManager.secondPrimary.withOpacity(1),
              ),
      ),
      leading: IconButton(
        icon: Icon(
          leadingIcon,
          size: 30,
          color: ColorsManager.primary.withOpacity(1),
        ),
        onPressed: onLeadingPressed,
        
      ),
    );
  }
}
