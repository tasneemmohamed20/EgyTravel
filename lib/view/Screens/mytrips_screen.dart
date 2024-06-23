import 'package:egy_travel/res/colors_manager.dart';
import 'package:egy_travel/view/Widgets/shared_appbar.dart';
import 'package:egy_travel/view/Widgets/all_places_widget.dart';
import 'package:flutter/material.dart';

class TripsScreen extends StatelessWidget {
  const TripsScreen({super.key, required this.screenTilte});
  final String screenTilte;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: ColorsManager.primary.withOpacity(1),
      appBar: CustomAppBar(
        title: screenTilte,
        enableBack: false,
        leading: backButton(context),
      ),
      body: const AllPlacesW(),
    ));
  }
}
