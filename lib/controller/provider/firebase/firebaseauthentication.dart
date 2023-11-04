import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FireAuthProvider extends ChangeNotifier {
  var isLoading = false ;
  SignUpByGoogle(context) async {
    debugger();
    isLoading= true;
    notifyListeners();
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication gAuth = await gUser!.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken:  gAuth.accessToken,
      idToken: gAuth.idToken,
    );
    debugger();
    
    isLoading= false;
    notifyListeners();
    return await FirebaseAuth.instance.signInWithCredential(credential);
    }
}
