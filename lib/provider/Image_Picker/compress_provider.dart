// import 'dart:developer';

import 'dart:io';

import 'package:bhai_chara/utils/showSnack.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';

class CompressProvider extends ChangeNotifier {
  bool isLoading = false;
  List<File> compressedImage = [];
  compressImages(List<File> imageFiles) async {
    List<File> compressedImages = [];
    try {
      for (File imageFile in imageFiles) {
        var compressedImage = await FlutterImageCompress.compressAndGetFile(
          imageFile.path,
          imageFile.path + 'file.jpg',
          quality: 50, // Adjust the image quality (0-100).
          // maxWidth: 800, // Set the maximum width of the image.
          // maxHeight: 600, // Set the maximum height of the image.
        );

        if (compressedImage != null) {
          compressedImages.add(File(compressedImage.path));
        }
      }

      compressedImage = compressedImages;
    } catch (e) {
      showSnack(text: e.toString());
    }

    // compressImage(List<File> selected) async {
    //   isLoading = true;
    //   notifyListeners();

    //   for (var i = 0; i < selected.length; i++) {
    //     var compressedFile = await FlutterImageCompress.compressAndGetFile(
    //       selected[i].path,
    //       selected[i].path,
    //       quality: 25,
    //     );

    //     compressedImage.add(File(compressedFile!.path));
    //   }
    isLoading = false;
    notifyListeners();
  }
}
