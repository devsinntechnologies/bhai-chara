import 'dart:io';

import 'package:flutter/material.dart';

import '../../services/Firebase_Manager.dart';

class FireStoreProvider extends ChangeNotifier {
  bool isLoading = false;
  addImage(List<File> selectedImages,
      {price,
      age,
      title,
      description,
      category,
      subcategory,
      isFree,
      uid,
      dateTime}) async {
    isLoading = true;
    notifyListeners();
    var data = await FirebaseManager.AddImages(selectedImages,
        price: price,
        title: title,
        description: description,
        age: age,
        category: category,
        subcategory: subcategory,
        isFree: isFree,
        datetime: dateTime,
        uid: uid);

    if (data != null) {
      return data;
    }
    isLoading = false;
    notifyListeners();
  }
}
