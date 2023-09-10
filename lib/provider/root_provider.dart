
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class RootProvider extends ChangeNotifier{
bool isLoading = false;
var _selectedScreen=0;

 selectedScreen(int index)
{
 
  
  _selectedScreen= index;
 notifyListeners();
}
}