

import 'package:flutter/material.dart';

bool light= false;
class  SplashProvider extends ChangeNotifier{
  void change(bool value){
     light = value;
     notifyListeners();
 }
}