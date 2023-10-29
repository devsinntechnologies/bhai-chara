import 'package:flutter/material.dart';

import '../../../utils/showSnack.dart';
import '../../services/Firebase_Manager.dart';

class ProductProvider extends ChangeNotifier {
  bool isLoading = false;
  addProduct(context,price, age, title, description) async {
    isLoading = true;
    notifyListeners();
    var data = await FirebaseManager.addProduct(
        price: price, age: age, title: title, description: description);
    if (data != null) {
      showSnack( context,"Product added");
    }
    isLoading = false;
    notifyListeners();
  }
}
