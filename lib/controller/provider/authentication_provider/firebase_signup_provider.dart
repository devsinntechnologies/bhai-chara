import 'dart:developer';

import 'package:bhai_chara/controller/services/Firebase_Manager.dart';
import 'package:bhai_chara/utils/custom_loader.dart';
import 'package:bhai_chara/utils/push.dart';
import 'package:bhai_chara/utils/showSnack.dart';
import 'package:bhai_chara/view/authentication/location.dart';
import 'package:bhai_chara/view/authentication/otp_code_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpProvider extends ChangeNotifier {
  bool isLoading = false;
  bool isEmailVerified = false;
  bool isPhoneVerify = false;
  String verifiedID = "";
  String OTPCode = "";
  var user;
  SignUpFirebase(context, name, email, password,
      {isEmailVerified, isPhoneVerified}) async {
    try {
      isLoading = true;
      notifyListeners();
      // ignore: unused_local_variable
      user = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      isEmailVerified = true;
      var data = await FirebaseManager.SignUpFirebaseStoreage(
          context, name, email, password, isEmailVerified, isPhoneVerified);
      isEmailVerified = isEmailVerified;

      if (user != null) {
        showSnack(context: context, text: "SignUp SuccessFully");
        return data;
      }
      isLoading = false;
      notifyListeners();
    } catch (e) {
      showSnack(context: context, text: "Error ! Something Went Wrong");
    }
  }

  PhoneVerifyFireBase(context, phoneNumber) async {
    try {
      isLoading = true;
      notifyListeners();

      var data =
          await FirebaseManager.PhoneNumberVerification(context, phoneNumber);
      verifiedID = FirebaseManager.verifyId;
      if (data != null) {
        showSnack(context: context, text: "Phone Verified SuccessFully");

        isLoading = false;
        notifyListeners();

        return data;
      }

      pushUntil(
          context,
          OTPScreen(
            phone: phoneNumber,
          ));
    } catch (e) {
      showSnack(context: context, text: "Error! Something went wrong");
    }
  }

  OTPVerify(context, String Otp) async {
    isLoading = true;
    notifyListeners();
    var isVerified = await FirebaseManager.VerifyOTP(verifiedID, Otp);
    if (isVerified) {
      isPhoneVerify = true;
      pushUntil(context, LocationScreen());
    }
    isLoading = false;
    notifyListeners();
  }
}