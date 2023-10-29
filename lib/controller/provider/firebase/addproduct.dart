import 'package:flutter/material.dart';

import '../../../utils/showSnack.dart';
import '../../services/Firebase_Manager.dart';

class ProductProvider extends ChangeNotifier {
  bool isLoading = false;
  addProduct(context,price, age, title, description) async {
    try {
      isLoading = true;
      notifyListeners();
      var data = await FirebaseManager.addProduct(
        price: price,
        age: age,
        title: title,
        description: description,
      );
      if (data != null) {
        return data;
      }
      isLoading = false;
      notifyListeners();
    } catch (e) {
      showSnack( context,e.toString());
    }
  }
}
