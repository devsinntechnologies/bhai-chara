import 'package:flutter/cupertino.dart';

class visibilityProvider extends ChangeNotifier{
  bool show= true;

  toggle()
  {
    notifyListeners();
   show= !show;
   notifyListeners();
  }
}