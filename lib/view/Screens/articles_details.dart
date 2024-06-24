import 'package:egy_travel/res/colors_manager.dart';
import 'package:egy_travel/view/Widgets/shared_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';

class ArticlesDetailsScreen extends StatelessWidget {
  const ArticlesDetailsScreen(
      {super.key,
      required this.image,
      required this.title,
      this.subtitle,
      required this.description});
  final String image;
  final String title;
  final String? subtitle;
  final List<String> description;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorsManager.primary.withOpacity(1),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height,
                child: SharedDetials(
                  description: description,
                  image: image,
                  subtitle: subtitle ?? '',
                  title: title,
                ),
              ),
            ],
          ),
        ),
        floatingActionButtonLocation: ExpandableFab.location,
        floatingActionButton: Align(
          alignment: AlignmentDirectional.bottomEnd,
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
