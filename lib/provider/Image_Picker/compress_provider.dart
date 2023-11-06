import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';

class CompressProvider extends ChangeNotifier {
  bool isLoading = false;
  List<File> compressedImage = [];
  compressImage(List<File> selected) async {
    isLoading = true;
    notifyListeners();

    for (var i = 0; i < selected.length; i++) {
      var compressedFile = await FlutterImageCompress.compressAndGetFile(
        selected[i].path,
        selected[i].path,
        quality: 25,
      );

      compressedImage.add(File(compressedFile!.path));
    }
    isLoading = false;
    notifyListeners();
  }
}
