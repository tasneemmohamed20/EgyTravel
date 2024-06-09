import 'package:egy_travel/Data/dummy_data.dart';
import 'package:egy_travel/res/colors_manager.dart';
import 'package:egy_travel/view/Widgets/view_all_widget.dart';
import 'package:flutter/material.dart';

class FavTrips extends StatefulWidget {
  const FavTrips({super.key});

  @override
  State<FavTrips> createState() => _FavTrips();
}

class _FavTrips extends State<FavTrips> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: ColorsManager.primary.withOpacity(1),
      body: ViewAllW(items: items),
    ));
  }
}
