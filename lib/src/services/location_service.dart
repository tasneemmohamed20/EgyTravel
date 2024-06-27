import 'package:egy_travel/src/controllers/location_controller.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';

class LocationService {
  LocationService.init();
  static LocationService instance = LocationService.init();

  final Location _location = Location();
  Future<bool> checkForServiceAvailability() async {
    bool isServiceEnabled = await _location.serviceEnabled();
    if (isServiceEnabled) {
      return Future.value(true);
    }
    isServiceEnabled = await _location.requestService();
    if (isServiceEnabled) {
      return Future.value(true);
    }

    return Future.value(true);
  }

  Future<bool> checkForPermission() async {
    PermissionStatus permission = await _location.hasPermission();

    if (permission == PermissionStatus.granted) {
      return Future.value(true);
    }
    permission = await _location.requestPermission();
    if (permission == PermissionStatus.granted) {
      return Future.value(true);
    }
    if (permission == PermissionStatus.deniedForever) {
      Get.snackbar('Permission Denied',
              'Please enable location permission from settings')
          .show();
    }
    return false;
  }

  Future<void> getLocation({required LocationController controller}) async {
    controller.updateIsAccessingLocation(true);
    if (!(await checkForServiceAvailability())) {
      controller.errorDescription.value = 'Location service is not enabled';
      controller.updateIsAccessingLocation(false);
      return;
    }
    if (!(await checkForPermission())) {
      controller.updateIsAccessingLocation(false);
      return;
    }

    final LocationData data = await _location.getLocation();
    controller.updateUserLocation(data);
    controller.updateIsAccessingLocation(false);
  }
}
