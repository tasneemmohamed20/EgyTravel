import 'package:egy_travel/res/colors_manager.dart';
import 'package:egy_travel/view/Screens/places_details_screen.dart';
import 'package:egy_travel/view/Widgets/HomeWidgets/list_card.dart';
import 'package:flutter/material.dart';

class ViewAllW extends StatelessWidget {
  const ViewAllW({
    super.key,
    this.screenTitle,
    required this.items,
  });

  final String? screenTitle;
  final List<Map<String, dynamic>> items;

  @override
  Widget build(BuildContext context) {
    final mQwidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
      ),
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return SizedBox(
            width: mQwidth * 0.9,
            child: InkWell(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PlacesDetailsScreen(
                    description: items[index]['description'],
                    image: items[index]['image'],
                    subtitle: items[index]['subtitle'],
                    title: items[index]['title'],
                  ),
                ),
              ),
              child: CustomListCard(
                image: item['image']!,
                title: item['title']!,
                subtitle: item['subtitle']!,
                imageWidth: mQwidth * 0.4,
                cardColor: ColorsManager.secondPrimary.withOpacity(1),
                titleColor: ColorsManager.primary.withOpacity(1),
                subtitleColor: ColorsManager.subTitle,
              ),
            ),
          );
        },
      ),
    );
  }
}
