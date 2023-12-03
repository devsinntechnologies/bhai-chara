import 'dart:developer';

import 'dart:io';

// import 'dart:js_interop';
import 'package:bhai_chara/utils/showSnack.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FirebaseManager {
  static final _auth = FirebaseAuth.instance;
  static String verifyId = '';
  static String code = '';
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

  static SignUpFirebaseStoreage(
    context,
    name,
    email,
    password,
    isEmailVerified,
    isPhoneVerify,
  ) async {
    try {
      var data = await FirebaseFirestore.instance.collection("Client").add({
        "Name": name,
        "Email": email,
        "Password": password,
        "isEmailVerified": isEmailVerified,
        "isPhoneVerified": isPhoneVerify,
      });
      return data;
    } catch (e) {
      debugger();
      showSnack(text: e.toString());
    }
  }

  static PhoneNumberVerification(context, String phoneNo) async {
    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
          phoneNumber: phoneNo,
          verificationCompleted: (PhoneAuthCredential credential) {},
          verificationFailed: (FirebaseAuthException e) {},
          codeSent: (String verificationId, int? resendToken) {
            FirebaseManager.verifyId = verificationId;
          },
          codeAutoRetrievalTimeout: (String verificationId) {});
    } catch (e) {
      showSnack(context: context, text: "Error SomeThing is Wrong");
    }
    // await _auth.verifyPhoneNumber(
    //   phoneNumber: phoneNo,
    //   verificationCompleted: (credentials) async {
    //     await _auth.signInWithCredential(credentials);
    //   },
    //   codeSent: (verificationId, resendToken) async {
    //     verifyId = verificationId;
    //   },
    //   codeAutoRetrievalTimeout: (verificationId) {
    //     verifyId = verificationId;
    //   },
    //   verificationFailed: (e) {
    //     if (e.code == "invalid-phone-number") {
    //       showSnack(
    //           context: context,
    //           text: "Error, The Provider phone number is not valid");
    //     } else {
    //       showSnack(context: context, text: "Something went wrong, Try Again!");
    //     }
    //   },
    // );
  }

  // ignore: non_constant_identifier_names
  static VerifyOTP(String verificationID, String OTP) async {
    // try {
    //   var credentials = await _auth.signInWithCredential(
    //       PhoneAuthProvider.credential(
    //           verificationId: verifyId, smsCode: code));
    //   return credentials;
    // } catch (e) {
    //   print("Firebase Auth Error: $e");
    // }

    String otp = OTP.trim();
    if (otp.isNotEmpty) {
      try {
        // Use the Firebase Auth instance to sign in with the OTP
        AuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationID,
          smsCode: otp,
        );
        UserCredential authResult =
            await _auth.signInWithCredential(credential);

        // If verification is successful, you can access the user information
        User? user = authResult.user;
        print('User ID: ${user?.uid}');

        return true;
        // Now, you can navigate to the next screen or perform other actions
      } catch (e) {
        print('Error verifying OTP: $e');
        // Handle the error, e.g., show an error message
      }
    } else {
      // Display an error message for an empty OTP
      print('Please enter the OTP');
    }
  }
}
// }
