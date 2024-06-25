import 'package:flutter/material.dart';
import 'package:egy_travel/res/colors_manager.dart';

class CustomSliverAppBar extends StatelessWidget {
  final String title;
  final Widget? leading;
  final String? backgroundImageUrl;
  final double expandedHeight;
  final double spcae;

  const CustomSliverAppBar({
    super.key,
    required this.title,
    this.backgroundImageUrl,
    required this.expandedHeight,
    this.leading,
    required this.spcae,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
        centerTitle: true,
        leadingWidth: spcae,
        expandedHeight: expandedHeight,
        floating: true,
        snap: true,
        backgroundColor: ColorsManager.secondPrimary.withOpacity(1),
        pinned: false,
        flexibleSpace: FlexibleSpaceBar(
          // centerTitle: true,
          title: Text(
            textAlign: TextAlign.center,
            title,
            style: TextStyle(
              fontSize: 20,
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
        leading: leading);
  }
}
