
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../view/home-screens/home_screen.dart';

class TimerProvider extends ChangeNotifier {
  Timer? _timer;

  void startTimer(BuildContext context) {
    if (_timer == null) {
      var _duration = Duration(seconds: 5);
      _timer = Timer(_duration, () {
        Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (context) => HomeScreen(),
        ));
        _timer?.cancel();
        _timer = null;
      });
    }
  }

  void cancelTimer() {
    _timer?.cancel();
    _timer = null;
  }
}
