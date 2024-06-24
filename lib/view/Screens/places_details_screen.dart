import 'package:egy_travel/Data/dummy_data.dart';
import 'package:egy_travel/res/colors_manager.dart';
import 'package:egy_travel/view/Widgets/floating_button.dart';
import 'package:egy_travel/view/Widgets/HomeWidgets/grid_card.dart';
import 'package:egy_travel/view/Widgets/shared_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';

class PlacesDetailsScreen extends StatelessWidget {
  const PlacesDetailsScreen(
      {super.key,
      required this.image,
      required this.title,
      required this.subtitle,
      required this.description});
  final String image;
  final String title;
  final String subtitle;
  final List<String> description;
  @override
  Widget build(BuildContext context) {
    final mQwidth = MediaQuery.of(context).size.width;

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
                    image: image,
                    subtitle: subtitle,
                    title: title,
                    description: description,
                  )),
              Padding(
                padding: const EdgeInsets.only(left: 32, top: 0, right: 32),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Row(
                    children: [
                      Text(
                        'Recommendations',
                        style: TextStyle(
                          color: ColorsManager.secondPrimary.withOpacity(1),
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(6),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 6.0,
                    mainAxisSpacing: 8.0,
                    childAspectRatio: 0.75,
                  ),
                  itemCount: items.length > 4 ? 4 : items.length,
                  itemBuilder: (context, index) {
                    final item = items[index];
                    return InkWell(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PlacesDetailsScreen(
                                  image: items[index]['image'],
                                  subtitle: items[index]['subtitle'],
                                  title: items[index]['title'],
                                  description: items[index]['description'],
                                )),
                      ),
                      child: CustomGridCard(
                        image: item['image'],
                        title: item['title'],
                        subtitle: item['subtitle'],
                        imageWidth: mQwidth * 0.4,
                        cardColor: ColorsManager.secondPrimary.withOpacity(1),
                        titleColor: ColorsManager.primary.withOpacity(1),
                        subtitleColor: ColorsManager.primary,
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
        floatingActionButtonLocation: ExpandableFab.location,
        floatingActionButton: const CustomFloatButtton(),
      ),
    );
  }
}
