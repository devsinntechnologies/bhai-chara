import 'dart:developer';

import 'package:bhai_chara/utils/preferences.dart';
import 'package:bhai_chara/utils/showSnack.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import '../../services/Screen_Manager.dart';

class AuthProvider extends ChangeNotifier {
  bool isLoading = false;

  String currentAddress = "";
  // ignore: unused_field
  Position? _currentPosition;
  Location(context) async {
    // debugger();
    try {
      isLoading = true;
      notifyListeners();

      var data = await ScreenManager.geoLocation(
          context);
          debugger();
      if (data != null) {
        currentAddress = data;
        await Preferences.saveAddress(data);
        return currentAddress;
      }
    } catch (e) {
      isLoading = false;
      notifyListeners();
      showSnack(
          context: context, text: "Here Have Some Problem Please Try Again");
    }
  }
}
