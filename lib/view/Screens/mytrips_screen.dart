import 'package:egy_travel/view/Widgets/shared_appbar.dart';
import 'package:egy_travel/view/Widgets/view_all_widget.dart';
import 'package:flutter/material.dart';
import "package:egy_travel/Data/dummy_data.dart";

class TripsScreen extends StatelessWidget {
  const TripsScreen({super.key, required this.screenTilte});
  final String screenTilte;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: CustomAppBar(
        title: screenTilte,
        enableBack: false,
        leading: backButton(context),
      ),
      body: ViewAllW(screenTitle: screenTilte, items: items),
    ));
  }
}
