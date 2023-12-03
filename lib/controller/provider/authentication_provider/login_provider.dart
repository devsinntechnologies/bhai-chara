import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../utils/push.dart';
import '../../../utils/showSnack.dart';
import '../../../view/home-screens/root_screen.dart';
import '../phone_number.dart';


class LoginProvider extends ChangeNotifier {
  bool isLoading = false;
  Login(context, emailController, passwordController) async {
    try {
      isLoading = true;
      notifyListeners();

      final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

      var uid = await firebaseAuth.signInWithEmailAndPassword(
          email: emailController, password: passwordController);

      UID_Provider.uid = await FirebaseAuth.instance.currentUser!.uid;

      print(UID_Provider.uid);
      isLoading = false;
      notifyListeners();
      showSnack(context: context, text: "SignIn Successfully");
      FocusScope.of(context).nextFocus();
      push(context, RootScreen());
      // ignore: unused_catch_clause
    } on FirebaseAuth catch (e) {
      isLoading = false;

      showSnack(
          context: context, text: "SomeThing Went Wrong Try Again Please");
    }
  }
}
