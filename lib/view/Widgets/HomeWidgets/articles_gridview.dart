import 'package:egy_travel/model/Home/ArticlesModels/articles_response.dart';
import 'package:egy_travel/res/colors_manager.dart';
import 'package:egy_travel/view/Screens/articles_details.dart';
import 'package:egy_travel/view/Widgets/HomeWidgets/grid_card.dart';
import 'package:flutter/material.dart';

class ArticlesGridView extends StatelessWidget {
  final List<ArticlesData> articlesData;

  const ArticlesGridView({super.key, required this.articlesData});

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
        itemCount: articlesData.length > 4 ? 4 : articlesData.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ArticlesDetailsScreen(
                        id: articlesData[index].id ?? '',
                        description: articlesData[index].description ?? [],
                        image: articlesData[index].image ?? '',
                        title: articlesData[index].title ?? '',
                      )),
            ),
            child: CustomGridCard(
              image: [articlesData[index].image ?? ''],
              title: articlesData[index].title ?? '',
              // subtitle: item['subtitle'],
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
