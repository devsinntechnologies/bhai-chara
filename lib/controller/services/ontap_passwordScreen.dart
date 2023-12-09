import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../common/buttons/custom_button.dart';
import '../../utils/push.dart';
import '../../utils/showSnack.dart';
import '../../view/authentication/signup_screen_by_phone.dart';

Widget ontapPasswordScreen(
    {context = BuildContext,
    confirmpasswordController,
    passwordController,
    email,
    name}) {
  return CustomButton(
      onTap: () async {
        if (passwordController.text.isEmpty) {
          showSnack(context: context, text: "Please Enter Password");
        } else if (confirmpasswordController.text.isEmpty) {
          showSnack(context: context, text: "Please Enter Confirm Password");
        } else if (passwordController.text != confirmpasswordController.text) {
          showSnack(context: context, text: "Please Enter Correct Password");
        } else if (passwordController.text.length < 6) {
          showSnack(
              context: context,
              text: "Password must at least 6 character long");
        } else {
          UserCredential userCredential =
              await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: email,
            password: passwordController.text,
          );

          // ignore: unnecessary_null_comparison
          if (userCredential != null) {
            User? user = userCredential.user;
            return user;
          }

          push(context, SignUpScreenByPhone());
        }
      },
      text: "Next");
}
