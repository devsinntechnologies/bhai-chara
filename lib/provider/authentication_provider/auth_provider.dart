import 'dart:developer';

import 'package:bhai_chara/services/Screen_Manager.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class AuthProvider extends ChangeNotifier {
  bool isLoading = false;

  String currentAddress = "";
  // ignore: unused_field
  Position? _currentPosition;
  Location(context, _currentPosition, _currentAddress) async {
    // debugger();
    isLoading = true;
    notifyListeners();

    var data = await ScreenManager.geoLocation(
        context, _currentPosition, _currentAddress);
    if (data != null) {
      currentAddress = data;
    }
    isLoading = false;
    notifyListeners();
  }
}
