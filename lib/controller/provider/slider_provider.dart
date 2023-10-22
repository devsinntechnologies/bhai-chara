import 'package:flutter/cupertino.dart';

class SliderProvider extends ChangeNotifier {
  double _fontSize = 16.0;
  double get fontSize => _fontSize;
   updateFontSize(double value) {
    _fontSize = value;
    notifyListeners();
  }
}
