import 'dart:io';

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ImageScreen extends StatelessWidget {
  ImageScreen({super.key, required this.imagePath});
  File imagePath;

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: InteractiveViewer(
            child: Image.file(
              imagePath,
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}
