import 'dart:developer';

import 'package:bhai_chara/controller/services/Firebase_Manager.dart';
import 'package:bhai_chara/utils/push.dart';
import 'package:bhai_chara/utils/showSnack.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../view/authentication/location.dart';

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

        return data;
      }
      isLoading = false;
      notifyListeners();
    } catch (e) {
      showSnack(context: context, text: "Error! Something went wrong");
    }
  }

  OTPVerify(context, String Otp) async {
    try {
      isLoading = true;
      notifyListeners();

      print(Otp);
      var isVerified = await FirebaseManager.VerifyOTP(verifiedID, Otp);
      debugger();
      if (isVerified != null) {
        isPhoneVerify = true;
        pushUntil(context, LocationScreen());
      }
      isLoading = false;
      notifyListeners();
    } catch (e) {
      print(e.toString());
      showSnack(context: context, text: e.toString());
    }
  }
}
