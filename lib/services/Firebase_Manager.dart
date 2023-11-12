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
      isFree,
      datetime}) async {
    try {
      var data = await FirebaseFirestore.instance.collection("Products").add({
        "price": price,
        "age": age,
        "title": title,
        "description": description,
        "category": category,
        "subcategory": subcategory,
        "urlImage": urlImage,
        "isFree": isFree,
        "Time": datetime,
      });
      return data;
    } catch (e) {
      debugger();
      showSnack(text: e.toString());
    }
  }

  static AddImages(List<File> selectedimages,
      {price,
      title,
      age,
      description,
      category,
      subcategory,
      isFree,
      datetime}) async {
    try {
      List<String> urlImage = [];

      Future<void> uploadImages(List<File> selectedImages) async {
        for (var i = 0; i < selectedImages.length; i++) {
          String uniqueFileName =
              DateTime.now().millisecondsSinceEpoch.toString();
          Reference referenceRoot = FirebaseStorage.instance.ref();
          Reference referenceDirImages = referenceRoot.child('images');
          Reference referenceImageToUpload =
              referenceDirImages.child(uniqueFileName);

          await referenceImageToUpload.putFile(File(selectedImages[i].path));

          String downloadUrl = await referenceImageToUpload.getDownloadURL();
          urlImage.add(downloadUrl);
        }
      }

// Call the function with your selected images list
      await uploadImages(selectedimages);

      // List<String> urlImage = [];
      // Reference referenceRoot = FirebaseStorage.instance.ref();
      // // ignore: unused_local_variable
      // Reference referenceDirImages = referenceRoot.child('images');
      // for (var i = 0; i < selectedimages.length; i++) {
      //   String uniqueFileName =
      //       DateTime.now().millisecondsSinceEpoch.toString();
      //   Reference referenceRoot = FirebaseStorage.instance.ref();
      //   Reference referenceDirImages = referenceRoot.child('images');
      //   Reference referenceImageToUpload =
      //       referenceDirImages.child(uniqueFileName);
      //   referenceImageToUpload.putFile(File(selectedimages[i].path));
      //   urlImage.add(await referenceImageToUpload.getDownloadURL());
      // }
      await addProduct(
          urlImage: urlImage,
          price: price,
          age: age,
          title: title,
          description: description,
          category: category,
          subcategory: subcategory,
          isFree: isFree,
          datetime: datetime);
    } catch (e) {
      // showSnack(text: e.toString());
      return null;
    }
  }
}
