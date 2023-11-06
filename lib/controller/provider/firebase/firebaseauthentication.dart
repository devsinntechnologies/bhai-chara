import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../utils/showSnack.dart';

class FireAuthProvider extends ChangeNotifier {
  var isLoading = false ;
  SignUpByGoogle(context) async {

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
    var data= await FirebaseAuth.instance.signInWithCredential(credential);
    if(data!=null)
    return data;
    else{
      showSnack(context,"google auth not working");
    }
   
    }
}
