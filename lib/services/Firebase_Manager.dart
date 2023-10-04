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
  static AddImages(List<File> selectedimages) async {
    for (var i = 0; i < selectedimages.length; i++) {
      try {
        String uniqueFileName =
            DateTime.now().millisecondsSinceEpoch.toString();
        Reference referenceRoot = FirebaseStorage.instance.ref();
        Reference referenceDirImages = referenceRoot.child('images');
        Reference referenceImageToUpload =
            referenceDirImages.child(uniqueFileName);
        await referenceImageToUpload.putFile(File(selectedimages[i].path));
        await referenceImageToUpload.getDownloadURL();
      } catch (e) {
        showSnack(text: e.toString());
      }
    }
  }

  // static uploadImages(List<File> selectedImages) async {
  //   try {
  //     var storage = FirebaseStorage.instance;
  //     var storageReference = storage.ref().child(
  //         'image_folder'); // Change 'image_folder' to your desired folder name

  //     // ignore: dead_code
  //     var imagesFile;

  //     // ignore: dead_code
  //     for (int i = 0; i < selectedImages.length; i++) {
  //       var uniqueId = DateTime.now()
  //           .millisecondsSinceEpoch
  //           .toString(); // Generate a unique timestamp-based identifier
  //       var imageFileName =
  //           'image_$uniqueId.jpg'; // Create a unique filename with the identifier
  //       var imageReference = storageReference.child(imageFileName);
  //       List data = [
  //         await imageReference.putFile(
  //           File(imagesFile[i]),
  //           SettableMetadata(),
  //         )
  //       ];
  //       debugger();
  //       return data[i];
  //     }
  //     showSnack(text: "Images are Uploaded");
  //   } catch (e) {
  //     showSnack(text: e.toString());
  //   }
  // }

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
