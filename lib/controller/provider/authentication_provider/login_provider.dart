import 'package:bhai_chara/utils/push.dart';
import 'package:bhai_chara/utils/showSnack.dart';
import 'package:bhai_chara/view/home-screens/root_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {
  bool isLoading = false;
  Login(context, emailController, passwordController) async {
    try {
      isLoading = true;
      ChangeNotifier();
      var firestore = FirebaseFirestore.instance;
      final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
      var userCredential = await firebaseAuth.createUserWithEmailAndPassword(
          email: emailController, password: passwordController);
      firestore.collection('users').doc(userCredential.user!.uid).set({
        'uid': userCredential.user!.uid,
        'email': emailController.text,
      }, SetOptions(merge: true));
      isLoading = false;
      ChangeNotifier();
      push(context, RootScreen());
    } catch (e) {
      showSnack(context: context, text: e.toString());
    }
  }
}
