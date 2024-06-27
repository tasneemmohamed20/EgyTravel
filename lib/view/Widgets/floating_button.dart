import 'package:egy_travel/res/app_assets.dart';
import 'package:egy_travel/res/colors_manager.dart';
import 'package:egy_travel/src/controllers/location_controller.dart';
import 'package:egy_travel/src/services/location_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomFloatButtton extends StatefulWidget {
  const CustomFloatButtton({super.key, required this.lat, required this.long});
  final double lat;
  final double long;

  @override
  State<CustomFloatButtton> createState() => _CustomFloatButttonState();
}

class _CustomFloatButttonState extends State<CustomFloatButtton> {
  final LocationController locationController =
      Get.put<LocationController>(LocationController());
  @override
  void initState() {
    LocationService.instance.getLocation(controller: locationController);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ExpandableFab(
      openButtonBuilder: RotateFloatingActionButtonBuilder(
        child: Image.asset(
          Assets.images4,
          scale: 8,
        ),
        fabSize: ExpandableFabSize.regular,
        // foregroundColor: Colors.amber,
        backgroundColor: ColorsManager.primary.withOpacity(1),
        shape: const CircleBorder(),
      ),
      closeButtonBuilder: DefaultFloatingActionButtonBuilder(
        child: Icon(
          Icons.close_rounded,
          color: ColorsManager.secondPrimary.withOpacity(1),
        ),
        fabSize: ExpandableFabSize.regular,
        // foregroundColor: Colors.deepOrangeAccent,
        backgroundColor: ColorsManager.primary.withOpacity(1),
        shape: const CircleBorder(),
      ),
      duration: const Duration(milliseconds: 300),
      type: ExpandableFabType.up,
      distance: 80.0,
      children: [
        FloatingActionButton(
          backgroundColor: ColorsManager.primary.withOpacity(1),
          shape: const CircleBorder(),
          heroTag: null,
          child: Icon(
            Icons.location_on_outlined,
            color: ColorsManager.secondPrimary.withOpacity(1),
          ),
          onPressed: () async {
            Location location = Location();
            LocationData locationData;
            locationData = await location.getLocation();
            setState(() {
              launchUrl(Uri.parse(
                  'https://www.google.com/maps/dir/?api=1&origin=${locationData.latitude},${locationData.longitude}&destination=${widget.lat},${widget.long}'));
            });
          },
        ),
        FloatingActionButton(
          backgroundColor: ColorsManager.primary.withOpacity(1),
          shape: const CircleBorder(),
          heroTag: null,
          child: Icon(
            Icons.bookmark_add_outlined,
            color: ColorsManager.secondPrimary.withOpacity(1),
          ),
          onPressed: () {},
        ),
        FloatingActionButton(
          backgroundColor: ColorsManager.primary.withOpacity(1),
          shape: const CircleBorder(),
          heroTag: null,
          child: Icon(
            Icons.favorite_border_outlined,
            color: ColorsManager.secondPrimary.withOpacity(1),
          ),
          onPressed: () {},
        ),
      ],
    );
  }
}
