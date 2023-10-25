import 'dart:io';

import 'package:bhai_chara/services/Firebase_Manager.dart';
import 'package:flutter/material.dart';

class FireStoreProvider extends ChangeNotifier {
  bool isLoading = false;
  addImage(
    List<File> selectedImages, {
    price,
    age,
    title,
    description,
    category,
    subcategory,
  }) async {
    isLoading = true;
    notifyListeners();
    var data = await FirebaseManager.AddImages(
      selectedImages,
      price: price,
      title: title,
      description: description,
      age: age,
      category: category,
      subcategory: subcategory,
    );

    if (data != null) {
      return data;
    }
    isLoading = false;
    notifyListeners();
  }
}
