import 'package:flutter/material.dart';

push(context, screen) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => screen),
  );
}

pushUntil(context, screen) {
  Navigator.pushAndRemoveUntil(
      context, MaterialPageRoute(builder: (_) => screen), (route) => false);
}
