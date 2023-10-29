import 'dart:developer';
import 'dart:io';
import 'package:bhai_chara/utils/showSnack.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseManager {
  static addProduct(
      {context,price, age, title, description, List<String>? urlImage}) async {
    try {
      debugger();
      var data = await FirebaseFirestore.instance.collection("Products").add({
        "price": price,
        "age": age,
        "title": title,
        "description": description,
        "urlImage": urlImage,
      });
      debugger();
      return data;
    } catch (e) {
      debugger();
      showSnack(context, e.toString());
    }
  }

  static AddImages(List<File> selectedimages,
      {context,price, title, age, description}) async {
    try {
      List<String> urlImage = [];
      for (var i = 0; i < selectedimages.length; i++) {
        String uniqueFileName =
            DateTime.now().millisecondsSinceEpoch.toString();
        Reference referenceRoot = FirebaseStorage.instance.ref();
        Reference referenceDirImages = referenceRoot.child('images');
        Reference referenceImageToUpload =
            referenceDirImages.child(uniqueFileName);
        await referenceImageToUpload.putFile(File(selectedimages[i].path));
        urlImage.add(await referenceImageToUpload.getDownloadURL());
      }

      await addProduct(
          urlImage: urlImage,
          price: price,
          age: age,
          title: title,
          description: description);
    } catch (e) {
      showSnack(context, e.toString());
    }
  }

  static SignInWithGoogle() async
  {

   // begain interactive sign in process

   final GoogleSignInAccount? gUser= await GoogleSignIn().signIn();

   //obtain auth details on request

   final GoogleSignInAuthentication? gAuth= await gUser!.authentication;

   //create a new credential for user

   final Credential = GoogleAuthProvider.credential();
   accessToken: gAuth?.accessToken;
   idToken: gAuth?.idToken;

   //finally, lets sign in

   return await FirebaseAuth.instance.signInWithCredential(Credential);
  }

}
