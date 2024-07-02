import 'package:get/get.dart';
import 'package:location/location.dart';

class LocationController extends GetxController {
  final RxBool isAccessingLocation = RxBool(false);
  final RxString errorDescription = RxString('');
  final Rx<LocationData?> userLocation = Rx<LocationData?>(null);
  void updateIsAccessingLocation(bool value) =>
      isAccessingLocation.value = value;
  void updateUserLocation(LocationData? data) => userLocation.value = data;
}
