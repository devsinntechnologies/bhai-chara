
// import 'package:flutter/material.dart';
// class  SplashProvider extends ChangeNotifier{
//   bool light= false;
//   void change(bool value){
//      light = value;
//      notifyListeners();
//  }
// }


import 'package:flutter/cupertino.dart';
class SwitchProvider extends ChangeNotifier{
   bool on= true;
  toggle()
  {
   on= !on;
   notifyListeners();
  }
}