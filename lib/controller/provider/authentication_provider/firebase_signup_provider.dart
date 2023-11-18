import 'package:bhai_chara/controller/services/Firebase_Manager.dart';
import 'package:bhai_chara/utils/showSnack.dart';
import 'package:flutter/material.dart';

class SignUpProvider extends ChangeNotifier {
  bool isLoading = false;
  bool isEmailV = false;
  SignUpFirebase(context, name, email, password, {isEmailVerified}) async {
    isEmailVerified = isEmailV;
    isLoading = true;
    notifyListeners();
    var data = await FirebaseManager.SignUpFirebaseStoreage(
        context, name, email, password, isEmailVerified);
    if (data != null) {
      showSnack(context: context, text: "SignUp SuccessFully");
      return data;
    }

    isLoading = false;
    notifyListeners();
  }
}
