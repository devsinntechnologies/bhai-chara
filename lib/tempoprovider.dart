


import 'package:flutter/cupertino.dart';
class SwitchProvider extends ChangeNotifier{
   bool on= true;
  toggle()
  {
   on= !on;
   notifyListeners();
  }
}