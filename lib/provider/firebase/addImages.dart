import 'dart:io';

import 'package:bhai_chara/services/Firebase_Manager.dart';
import 'package:flutter/material.dart';

import '../../utils/showSnack.dart';

class FireStoreProvider extends ChangeNotifier {
  bool isLoading = false;
  addImage(List<File> selectedImages) async {
    isLoading = true;
    notifyListeners();
    var data = await FirebaseManager.uploadImages(selectedImages);
    // ignore: unnecessary_null_comparison
    if (data != null) {
      showSnack(text: "Image added");
    }
    isLoading = false;
    notifyListeners();
  }
}
