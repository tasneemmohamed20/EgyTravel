import 'package:egy_travel/Data/dummy_data.dart';
import 'package:egy_travel/Widgets/home_drawer.dart';
import 'package:egy_travel/Widgets/shared_appbar.dart';
import 'package:egy_travel/constants/app_assets.dart';
import 'package:egy_travel/constants/colors_manager.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  Home({super.key});
  final _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
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
            body: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                      child: Padding(
                    padding: const EdgeInsets.only(top: 16, bottom: 32),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: MediaQuery.of(context).size.height * 0.07,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        color: Colors.white70,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: _searchController,
                              decoration: const InputDecoration(
                                hintText: 'Search...',
                                border: InputBorder.none,
                                prefixIcon: Icon(Icons.search),
                              ),
                              onChanged: (query) {
                                // setState(() => _isSearching = query.isNotEmpty);
                                // widget.onSearch(query); // Call the search callback
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  )),
                  SizedBox(
                      height: MediaQuery.of(context).size.height * 0.2,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: items.length,
                          itemBuilder: (context, index) {
                            final item = items[index];
                            return SizedBox(
                              width: MediaQuery.of(context).size.width * 0.9,
                              // height:
                              //     MediaQuery.of(context).size.height * 0.15,
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width * 0.9,
                                height:
                                    MediaQuery.of(context).size.height * 0.1,
                                child: Card(
                                    // margin:
                                    //     const EdgeInsets.only(left: 32, right: 8),
                                    child: Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 8, horizontal: 16),
                                      child: Row(
                                        children: [
                                          Image.asset(
                                            Assets.profile,
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                                    // ListTile(
                                    //   leading: Image.asset(
                                    //     Assets.profile,
                                    //     fit: BoxFit.fitHeight,
                                    //     width: 200,
                                    //     height: 200,
                                    //   ),
                                    //   title: Text(item['title']),
                                    //   subtitle: Text(item['subtitle']),
                                    // ),
                                    ),
                              ),
                            );
                          }))
                  // SizedBox(
                  //   height: 200,
                  //   child: Expanded(
                  //     child: ListView.builder(
                  //       // scrollDirection: Axis.horizontal,
                  //       itemCount: items.length,
                  //       itemBuilder: (context, index) {
                  //         final item = items[index];
                  //         return Card(
                  //           child: ListTile(
                  //             leading: Image.asset(
                  //               Assets.profile,
                  //               fit: BoxFit.cover,
                  //             ),
                  //             title: Text(item['title']),
                  //             subtitle: Text(item['subtitle']),
                  //             // onTap: () {/* Navigate to a detail page for the item */}, // Optional
                  //           ),
                  //         );
                  //       },
                  //     ),
                  //   ),
                  // )
                ])));
  }
}
