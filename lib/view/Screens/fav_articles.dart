import 'package:egy_travel/res/colors_manager.dart';
import 'package:egy_travel/view/Widgets/view_all_widget.dart';
import 'package:flutter/material.dart';

class FavArticles extends StatelessWidget {
  const FavArticles({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: ColorsManager.primary.withOpacity(1),
      body:  ViewAllW(),
    ));
  }
}
