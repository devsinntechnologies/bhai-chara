import 'dart:developer';

import 'package:bhai_chara/common/smakebar.dart';
import 'package:bhai_chara/services/firebase_manager.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  static IncrementVariable(var variable) {
    variable = variable + 1;
    return variable;
  }
   var isloading = false;
   createUser(context,email,password)async{
  if(email.isEmpty){
    showSnack(context, "Please enter email");
  }else if(password.isEmpty){
    showSnack(context, "Please enter password");

  }
  else{
  isloading = true;
  notifyListeners();
  var res = FirebaseManager.CreateUser(context,email,password);
  
  if(res != null){

   isloading = false;
  notifyListeners();
  //shere pref
  }
  }

  }
}
