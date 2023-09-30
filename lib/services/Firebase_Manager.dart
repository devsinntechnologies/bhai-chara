import 'package:bhai_chara/utils/showSnack.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseManager {
  static AddProduct({price, age, title, description}) async {
    try {
      var data = await FirebaseFirestore.instance.collection("Products").add({
        "price": price,
        "age": age,
        "title": title,
        "description": description
      });
      return data;
    } catch (e) {
      showSnack(text: e.toString());
    }
  }

  static GetProduct() {}
}
