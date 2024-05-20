import 'package:egy_travel/Data/dummy_data.dart';
import 'package:egy_travel/Widgets/grid_card.dart';
import 'package:egy_travel/Widgets/home_drawer.dart';
import 'package:egy_travel/Widgets/list_card.dart';
import 'package:egy_travel/Widgets/search_bar.dart';
import 'package:egy_travel/Widgets/shared_appbar.dart';
import 'package:egy_travel/constants/colors_manager.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  Home({super.key});
  final _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final mQwidth = MediaQuery.of(context).size.width;
    final mQheight = MediaQuery.of(context).size.height;

    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: ColorsManager.primary.withOpacity(1),
            appBar: CustomAppBar(
              title: 'Home',
              enableBack: true,
              leading: Builder(
                builder: (context) => IconButton(
                  icon: Icon(Icons.menu,
                      size: 30, color: ColorsManager.primary.withOpacity(1)),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                ),
              ),
            ),
            drawer: const MainDrawer(),
            body: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomSearchBar(
                      searchController: _searchController,
                      onChanged: (query) {},
                      width: mQwidth * 0.9,
                      height: mQheight * 0.07,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 32),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'YOU MAY LIKE',
                          style: TextStyle(
                            color: ColorsManager.secondPrimary.withOpacity(1),
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 6, right: 6),
                      child: SizedBox(
                          height: mQheight * 0.2,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: items.length > 4 ? 4 : items.length,
                              itemBuilder: (context, index) {
                                final item = items[index];
                                return SizedBox(
                                    width: mQwidth * 0.9,
                                    child: CustomListCard(
                                        image: item['image'],
                                        title: item['title'],
                                        subtitle: item['subtitle'],
                                        imageWidth: mQwidth * 0.4,
                                        cardColor: ColorsManager.secondPrimary
                                            .withOpacity(1),
                                        titleColor: ColorsManager.primary
                                            .withOpacity(1),
                                        subtitleColor: ColorsManager.subTitle));
                              })),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 32, top: 16, right: 32),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Row(
                          children: [
                            Text(
                              'PLACES',
                              style: TextStyle(
                                color:
                                    ColorsManager.secondPrimary.withOpacity(1),
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                              ),
                            ),
                            const Spacer(),
                            TextButton(
                                onPressed: () {},
                                child: Text(
                                  'VIEW ALL',
                                  style: TextStyle(
                                    color: ColorsManager.secondPrimary
                                        .withOpacity(1),
                                    fontSize: 15,
                                  ),
                                ))
                          ],
                        ),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.all(6),
                        child: GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount:
                                  2, // Number of columns in the grid
                              crossAxisSpacing:
                                  6.0, // Horizontal spacing between grid items
                              mainAxisSpacing:
                                  8.0, // Vertical spacing between grid items
                              childAspectRatio:
                                  0.75, // Aspect ratio of each grid item
                            ),
                            itemCount: items.length > 4 ? 4 : items.length,
                            itemBuilder: (context, index) {
                              final item = items[index];
                              return CustomGridCard(
                                image: item['image'],
                                title: item['title'],
                                subtitle: item['subtitle'],
                                imageWidth: mQwidth * 0.4,
                                cardColor:
                                    ColorsManager.secondPrimary.withOpacity(1),
                                titleColor:
                                    ColorsManager.primary.withOpacity(1),
                                subtitleColor: ColorsManager.subTitle,
                              );
                            })),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 32, top: 16, right: 32),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Row(
                          children: [
                            Text(
                              'ARTICLES',
                              style: TextStyle(
                                color:
                                    ColorsManager.secondPrimary.withOpacity(1),
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                              ),
                            ),
                            const Spacer(),
                            TextButton(
                                onPressed: () {},
                                child: Text(
                                  'VIEW ALL',
                                  style: TextStyle(
                                    color: ColorsManager.secondPrimary
                                        .withOpacity(1),
                                    fontSize: 15,
                                  ),
                                ))
                          ],
                        ),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.all(6),
                        child: GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount:
                                  2, // Number of columns in the grid
                              crossAxisSpacing:
                                  6.0, // Horizontal spacing between grid items
                              mainAxisSpacing:
                                  8.0, // Vertical spacing between grid items
                              childAspectRatio:
                                  0.75, // Aspect ratio of each grid item
                            ),
                            itemCount: items.length > 4 ? 4 : items.length,
                            itemBuilder: (context, index) {
                              final item = items[index];
                              return CustomGridCard(
                                image: item['image'],
                                title: item['title'],
                                subtitle: item['subtitle'],
                                imageWidth: mQwidth * 0.4,
                                cardColor:
                                    ColorsManager.secondPrimary.withOpacity(1),
                                titleColor:
                                    ColorsManager.primary.withOpacity(1),
                                subtitleColor: ColorsManager.subTitle,
                              );
                            }))
                  ]),
            )));
  }
}
