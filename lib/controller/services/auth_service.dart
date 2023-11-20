import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../common/custom_button.dart';
import '../../utils/push.dart';
import '../../utils/showSnack.dart';
import '../../view/authentication/signup_screen_by_phone.dart';

class AuthService extends ChangeNotifier{
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  static FirebaseFirestore firestore= FirebaseFirestore.instance;

  Future<UserCredential> signInWithEmailandPassword(
      String email, String password) async {
    try {
      UserCredential userCredential = await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);

          firestore.collection('users').doc(userCredential.user.uid).set({
            'uid': userCredential.user.uid,
            'email':email,
          }SetOptions(merge: true)
          
          );

          return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }
}
