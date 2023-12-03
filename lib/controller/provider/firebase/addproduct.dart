import 'package:bhai_chara/utils/showSnack.dart';
import 'package:flutter/material.dart';
import '../../services/Firebase_Manager.dart';

class ProductProvider extends ChangeNotifier {
  bool isLoading = false;
  addProduct(price, age, title, description, {category, subcategory}) async {
    try {
      isLoading = true;
      notifyListeners();
      var data = await FirebaseManager.addProduct(
          price: price,
          age: age,
          title: title,
          description: description,
          category: category,
          subcategory: subcategory);
      if (data != null) {
        return data;
      }
      isLoading = false;
      notifyListeners();
    } catch (e) {
      showSnack(text: e.toString());
    }
  }
}
