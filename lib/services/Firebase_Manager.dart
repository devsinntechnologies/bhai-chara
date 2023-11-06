import 'dart:developer';
import 'dart:io';
import 'package:bhai_chara/utils/showSnack.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FirebaseManager {
  static addProduct(
      {price,
      age,
      title,
      description,
      category,
      subcategory,
      List<String>? urlImage,
      isFree}) async {
    try {
      var data = await FirebaseFirestore.instance.collection("Products").add({
        "price": price,
        "age": age,
        "title": title,
        "description": description,
        "category": category,
        "subcategory": subcategory,
        "urlImage": urlImage,
        "isFree": isFree
      });
      return data;
    } catch (e) {
      debugger();
      showSnack(text: e.toString());
    }
  }

  static AddImages(List<File> selectedimages,
      {price, title, age, description, category, subcategory, isFree}) async {
    try {
      List<String> urlImage = [];
      Reference referenceRoot = FirebaseStorage.instance.ref();
      Reference referenceDirImages = referenceRoot.child('images');
      for (var i = 0; i < selectedimages.length; i++) {
        String uniqueFileName =
            DateTime.now().millisecondsSinceEpoch.toString();
        Reference referenceImageToUpload =
            referenceDirImages.child(uniqueFileName);
        referenceImageToUpload.putFile(File(selectedimages[i].path));
        // debugger();
        String url = await referenceImageToUpload.getDownloadURL();
        urlImage.add(url);
      }
      // await addProduct(
      //     urlImage: urlImage,
      //     price: price,
      //     age: age,
      //     title: title,
      //     description: description,
      //     category: category,
      //     subcategory: subcategory,
      //     isFree: isFree);
    } catch (e) {
      showSnack(text: e.toString());
    }
  }
}
