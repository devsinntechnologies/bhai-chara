import 'package:bhai_chara/utils/showSnack.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class ScreenManager {
  static geoLocation(context, _currentPosition, _currentAddress) async {
    try {
      if (!(await Permission.location.isGranted)) {
        await Permission.location.request();
        return;
      }
      var position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best,
          forceAndroidLocationManager: true);

      // ignore: unnecessary_null_comparison
      if (position != null) {
        _currentPosition = position;
        _currentAddress =
            _getAddressFromLatLng(context, _currentPosition, _currentAddress);
        return _currentAddress;
      }
    } catch (e) {
      showSnack( context: context,text: e.toString(), );
    }
  }

  static _getAddressFromLatLng(
      context, _currentPosition, _currentAddress) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
          _currentPosition.latitude, _currentPosition.longitude);

      Placemark place = placemarks[0];
      // ignore: unnecessary_null_comparison
      if (place != null) {
        _currentAddress =
            "${place.locality}, ${place.postalCode}, ${place.country}";
      }
      return _currentAddress;
    } catch (e) {
      showSnack( context: context,text:  e.toString());
    }
  }
}
