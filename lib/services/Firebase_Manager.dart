import 'dart:developer';
import 'dart:io';

import 'package:bhai_chara/utils/showSnack.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/widgets.dart';

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

  static uploadImages(List<File> selectedImages) async {
    try {
      final storage = FirebaseStorage.instance;
      final storageReference = storage.ref().child(
          'image_folder'); // Change 'image_folder' to your desired folder name

      for (int i = 0; i < selectedImages.length; i++) {
        var imageFile = selectedImages;
        final uniqueId = DateTime.now()
            .millisecondsSinceEpoch
            .toString(); // Generate a unique timestamp-based identifier
        final imageFileName =
            'image_$uniqueId.jpg'; // Create a unique filename with the identifier
        final imageReference = storageReference.child(imageFileName);
        var data = await imageReference.putFile(imageFile[i]);
        debugger();
        return data;
      }
      showSnack(text: "Images are Uploaded");
    } catch (e) {
      showSnack(text: e.toString());
    }
  }

  // static uploadImages(List<File> selectedImages) async {
  //   try {
  //     final storage = FirebaseStorage.instance;
  //     // ignore: dead_code
  //     for (int i = 0; i < selectedImages.length; i++) {
  //       final reference =
  //           storage.ref().child('images/${DateTime.now().toString()}');
  //       var data = await reference.putFile(File(selectedImages[i] as String));
  //       debugger();
  //       return data;
  //     }
  //   } catch (e) {
  //     debugger();
  //     showSnack(text: e.toString());
  //   }
  // }
}
