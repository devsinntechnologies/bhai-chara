import 'dart:html';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthServices{

  //google sign in

  SignInWithGoogle() async
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