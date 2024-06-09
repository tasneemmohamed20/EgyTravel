import 'package:egy_travel/res/colors_manager.dart';
import 'package:egy_travel/Data/dummy_data.dart';
import 'package:egy_travel/view/Widgets/shared_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';

class ArticlesDetailsScreen extends StatelessWidget {
  const ArticlesDetailsScreen(
      {super.key,
      required this.image,
      required this.title,
      required this.subtitle,
      required this.description});
  final String image;
  final String title;
  final String subtitle;
  final String description;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SharedDetials(
          items: items,
          description: description,
          image: image,
          subtitle: subtitle,
          title: title,
        ),
        floatingActionButtonLocation: ExpandableFab.location,
        floatingActionButton: Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: FloatingActionButton(
              backgroundColor: ColorsManager.primary.withOpacity(1),
              shape: const CircleBorder(),
              heroTag: null,
              child: Icon(
                Icons.favorite_border_outlined,
                color: ColorsManager.secondPrimary.withOpacity(1),
              ),
              onPressed: () {},
            ),
          ),
        ),
      ),
    );
  }
}
