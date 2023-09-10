import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class RootProvider extends ChangeNotifier {
  bool isLoading = false;
  var _selectedScreen = 0;
  int get selectedScreenValue => _selectedScreen;
   void setSelectedScreen(int index) {
    _selectedScreen = index;
    notifyListeners();
  }
}
