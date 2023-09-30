import 'package:bhai_chara/services/Firebase_Manager.dart';
import 'package:bhai_chara/utils/showSnack.dart';
import 'package:flutter/material.dart';

class ProductProvider extends ChangeNotifier {
  bool isLoading = false;
  addProduct(price, age, title, description) async {
    isLoading = true;
    notifyListeners();
    var data = await FirebaseManager.AddProduct(
        price: price, age: age, title: title, description: description);
    if (data != null) {
      showSnack(text: "Product added");
    }
    isLoading = false;
    notifyListeners();
  }
}
