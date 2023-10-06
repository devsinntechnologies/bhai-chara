import 'dart:io';

import 'package:bhai_chara/services/Firebase_Manager.dart';
import 'package:flutter/material.dart';

class FireStoreProvider extends ChangeNotifier {
  bool isLoading = false;
  addImage(List<File> selectedImages) async {
    isLoading = true;
    notifyListeners();
    var data = await FirebaseManager.AddImages(selectedImages);

    if (data != null) {
      return data;
    }
    isLoading = false;
    notifyListeners();
  }
}