import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

import '../common/smakebar.dart';

class FirebaseManager{


  static  CreateUser(context,email,password){
   
    try{
        debugger();
  var data = FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);

  return data;
    }catch(e){
     
      showSnack(context, e.toString());
    }
  }
}