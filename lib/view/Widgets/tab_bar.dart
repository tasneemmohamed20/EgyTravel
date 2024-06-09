import 'package:egy_travel/res/colors_manager.dart';
import 'package:egy_travel/view/Screens/fav_articles.dart';
import 'package:egy_travel/view/Screens/fav_trips.dart';
import 'package:egy_travel/view/Widgets/shared_appbar.dart';
import 'package:flutter/material.dart';

class Tabs extends StatefulWidget {
  const Tabs({super.key});

  @override
  TabsState createState() => TabsState();
}

class TabsState extends State<Tabs> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: backButton(context),
        backgroundColor: ColorsManager.secondPrimary.withOpacity(1),
        title: Text(
          'Favorites',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: ColorsManager.primary.withOpacity(1),
          ),
        ),
        bottom: TabBar(
          labelColor: ColorsManager.primary.withOpacity(1),
          controller: _tabController,
          dividerColor: ColorsManager.primary.withOpacity(1),
          unselectedLabelColor: Colors.grey,
          indicatorColor: ColorsManager.primary.withOpacity(1),
          tabs: const [
            Tab(icon: Icon(Icons.map_rounded), text: 'Trips'),
            Tab(icon: Icon(Icons.article_rounded), text: 'Articles'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          FavTrips(),
          FavArticles(),
        ],
      ),
    );
  }
}
