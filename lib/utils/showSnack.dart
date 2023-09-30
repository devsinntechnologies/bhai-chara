import 'package:flutter/material.dart';

showSnack({context, text = "Please Enter the Input Field"}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(text),
  ));
}
