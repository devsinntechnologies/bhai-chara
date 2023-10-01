import 'dart:io';

import 'package:bhai_chara/utils/showSnack.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FirebaseManager {
  static addProduct({price, age, title, description}) async {
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
  static AddImages(path) async {
    String uniqueFileName = DateTime.now().millisecondsSinceEpoch.toString();
    Reference referenceRoot = FirebaseStorage.instance.ref();
    Reference referenceDirImages = referenceRoot.child('images');
    Reference referenceImageToUpload = referenceDirImages.child(uniqueFileName);
    try {
      await referenceImageToUpload.putFile(File(path));
      await referenceImageToUpload.getDownloadURL();
    } catch (e) {
      showSnack(text: e.toString());
    }
  }
}
