import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class AddImage extends StatelessWidget {
  AddImage({super.key});
  final ImagePicker _picker = ImagePicker();
  void ImageSelect() async {
    final XFile? selectedImage = await _picker.pickImage(
        source: ImageSource.gallery, maxHeight: 100, maxWidth: 100);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: GridView.builder(
      gridDelegate:
          SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 20),
      itemBuilder: (BuildContext context, index) {
        return CircularProgressIndicator();
      },
    )));
  }
}
