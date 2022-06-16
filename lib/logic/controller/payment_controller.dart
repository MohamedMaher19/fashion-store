
import 'package:flutter/widgets.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class PaymentController extends GetxController {
  var phoneNumber = ''.obs;
  var latitude = ''.obs;
  var longtitude = ''.obs;
  var address = ''.obs;
  RxBool isLoading = true.obs;

  // location

  Future<void> updateLocation( ) async {
    isLoading(true);
    Position position = await _determinePosition();

    List<Placemark> placemarks = await placemarkFromCoordinates(position.altitude, position.longitude);
    Placemark place = placemarks[0];
    address.value = '${place.country} , ${place.administrativeArea}';
    print(place);
    print(address.value);
    isLoading(false);

  }

  // reafy code form package

  Future _determinePosition( ) async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      print('------------------');

    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      // if (permission == LocationPermission.denied) {
      //   return Future.error('Location permissions are denied');
      // }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition();
  }
}
