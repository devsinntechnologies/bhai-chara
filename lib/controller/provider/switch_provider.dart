import 'package:flutter/cupertino.dart';

class SwitchProvider extends ChangeNotifier{
   bool on= true;
  bool allow = true;
  
  toggle()
  {
   on= !on;
   notifyListeners();
  }
  
  change()
  {
   allow= !allow;
   notifyListeners();
  }
}