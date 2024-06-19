import 'package:egy_travel/Data/dummy_data.dart';
import 'package:egy_travel/res/colors_manager.dart';
import 'package:egy_travel/view/Screens/articles_details.dart';
import 'package:egy_travel/view/Widgets/HomeWidgets/grid_card.dart';
import 'package:flutter/material.dart';

class ArticlesGridView extends StatelessWidget {
  const ArticlesGridView({super.key});

  @override
  Widget build(BuildContext context) {
    final mQwidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsetsDirectional.all(6),
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
          return GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ArticlesDetailsScreen(
                        description: items[index]['description'],
                        image: items[index]['image'],
                        subtitle: items[index]['subtitle'],
                        title: items[index]['title'],
                      )),
            ),
            child: CustomGridCard(
              image: item['image'],
              title: item['title'],
              subtitle: item['subtitle'],
              imageWidth: mQwidth * 0.4,
              cardColor: ColorsManager.secondPrimary.withOpacity(1),
              titleColor: ColorsManager.primary.withOpacity(1),
              subtitleColor: ColorsManager.subTitle,
            ),
          );
        },
      ),
    );
  }
}
