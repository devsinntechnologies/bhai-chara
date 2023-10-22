import 'package:flutter/material.dart';

showSnack(ontext, text = "Please Enter the Input Field") {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(text),
  ));
}
