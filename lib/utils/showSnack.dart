import 'package:flutter/material.dart';

showSnack({context, text = "Please Fill all fields"}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(text),
  ));
}
