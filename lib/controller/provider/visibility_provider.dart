import 'package:flutter/cupertino.dart';

class visibilityProvider1 extends ChangeNotifier{
  bool show= true;

  toggle()
  {
    
   show= !show;
   notifyListeners();
  }
}

class visibilityProvider2 extends ChangeNotifier{
  bool show= true;

  toggle()
  {
    
   show= !show;
   notifyListeners();
  }
}