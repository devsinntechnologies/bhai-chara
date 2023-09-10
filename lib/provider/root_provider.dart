
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class RootProvider extends ChangeNotifier{
bool isLoading = false;
var _selectedScreen;

 selectedScreen(int index)
{
  isLoading=true;
  notifyListeners();
  _selectedScreen= index;
  isLoading=false;
  notifyListeners();
}
}