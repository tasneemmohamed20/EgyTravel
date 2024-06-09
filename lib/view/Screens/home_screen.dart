import 'package:egy_travel/Data/dummy_data.dart';
import 'package:egy_travel/view/Screens/articles_details.dart';
import 'package:egy_travel/view/Screens/places_details_screen.dart';
import 'package:egy_travel/view/Screens/view_all.dart';
import 'package:egy_travel/view/Widgets/bottom_navbar.dart';
import 'package:egy_travel/view/Widgets/grid_card.dart';
import 'package:egy_travel/view/Widgets/home_drawer.dart';
import 'package:egy_travel/view/Widgets/list_card.dart';
import 'package:egy_travel/view/Widgets/search_bar.dart';
import 'package:egy_travel/view/Widgets/sliver_appbar.dart';
import 'package:egy_travel/res/colors_manager.dart';
import 'package:flutter/material.dart';

// enum _SelectedTab { home, plans, events }

class Home extends StatefulWidget {
  const Home({
    super.key,
  });

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _searchController = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final mQwidth = MediaQuery.of(context).size.width;
    final mQheight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
          key: _scaffoldKey,
          extendBody: true,
          resizeToAvoidBottomInset: false,
          backgroundColor: ColorsManager.primary.withOpacity(1),
          drawer: const MainDrawer(),
          body: CustomScrollView(
            slivers: [
              CustomSliverAppBar(
                title: 'Home',
                leadingIcon: Icons.menu,
                expandedHeight: 64.0,
                onLeadingPressed: () {
                  _scaffoldKey.currentState?.openDrawer();
                },
              ),
              SliverToBoxAdapter(
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
                              child: InkWell(
                                onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => PlacesDetailsScreen(
                                            image: items[index]['image'],
                                            subtitle: items[index]['subtitle'],
                                            title: items[index]['title'],
                                            description: items[index]
                                                ['description'],
                                          )),
                                ),
                                child: CustomListCard(
                                  image: item['image'],
                                  title: item['title'],
                                  subtitle: item['subtitle'],
                                  imageWidth: mQwidth * 0.4,
                                  cardColor: ColorsManager.secondPrimary
                                      .withOpacity(1),
                                  titleColor:
                                      ColorsManager.primary.withOpacity(1),
                                  subtitleColor: ColorsManager.subTitle,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
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
                              onPressed: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const ViewAll(
                                          screenTilte: 'PLACES',
                                        )),
                              ),
                              child: Text(
                                'VIEW ALL',
                                style: TextStyle(
                                  color: ColorsManager.secondPrimary
                                      .withOpacity(1),
                                  fontSize: 15,
                                ),
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
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
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
                                  builder: (context) => PlacesDetailsScreen(
                                        image: items[index]['image'],
                                        subtitle: items[index]['subtitle'],
                                        title: items[index]['title'],
                                        description: items[index]
                                            ['description'],
                                      )),
                            ),
                            child: CustomGridCard(
                              image: item['image'],
                              title: item['title'],
                              subtitle: item['subtitle'],
                              imageWidth: mQwidth * 0.4,
                              cardColor:
                                  ColorsManager.secondPrimary.withOpacity(1),
                              titleColor: ColorsManager.primary.withOpacity(1),
                              subtitleColor: ColorsManager.subTitle,
                            ),
                          );
                        },
                      ),
                    ),
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
                              onPressed: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const ViewAll(
                                          screenTilte: 'ARTICLES',
                                        )),
                              ),
                              child: Text(
                                'VIEW ALL',
                                style: TextStyle(
                                  color: ColorsManager.secondPrimary
                                      .withOpacity(1),
                                  fontSize: 15,
                                ),
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
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
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
                                        description: items[index]
                                            ['description'],
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
                              cardColor:
                                  ColorsManager.secondPrimary.withOpacity(1),
                              titleColor: ColorsManager.primary.withOpacity(1),
                              subtitleColor: ColorsManager.subTitle,
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          bottomNavigationBar: const CustomBottomNavigationBar()),
    );
  }
}
