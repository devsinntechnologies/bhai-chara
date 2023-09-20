import 'package:flutter/material.dart';

showSnack({context, text = "Please Complete FIll the Field"}) {
  var snackBar = SnackBar(content: Text(text));
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
