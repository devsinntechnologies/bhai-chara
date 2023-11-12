import 'package:flutter/material.dart';

showSnack(context, text ) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(text),
  ));
}
