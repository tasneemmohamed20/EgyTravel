import 'package:egy_travel/res/colors_manager.dart';
import 'package:egy_travel/view/Widgets/fast_filter_bar.dart';
import 'package:egy_travel/view/Widgets/search_bar.dart';
import 'package:egy_travel/view/Widgets/shared_appbar.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});
  final _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final mQwidth = MediaQuery.of(context).size.width;
    final mQheight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
          backgroundColor: ColorsManager.primary.withOpacity(1),
          appBar: CustomAppBar(
            title: 'Search',
            enableBack: false,
            leading: backButton(context),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Center(
                  child: CustomSearchBar(
                readOnly: false,
                searchController: _searchController,
                onChanged: (query) {},
                width: mQwidth * 0.9,
                height: mQheight * 0.07,
              )),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: FastFilterBarC(),
              ),
            ],
          )),
    );
  }
}
