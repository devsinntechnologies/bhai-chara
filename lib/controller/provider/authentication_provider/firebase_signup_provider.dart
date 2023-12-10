import 'package:cloud_firestore/cloud_firestore.dart';

import '../../provider/phone_number.dart';
import 'package:bhai_chara/controller/services/Firebase_Manager.dart';
import 'package:bhai_chara/utils/push.dart';
import 'package:bhai_chara/utils/showSnack.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../view/authentication/location.dart';
import '../../../view/authentication/signup_screen_by_phone.dart';

class SignUpProvider extends ChangeNotifier {
  bool isLoading = false;
  String PhoneNumber = "";
  String verifiedID = "";
  String OTPCode = "";
  var user;
  SignUpFirebase(context, name, email, password,
      {isEmailVerified = false, isPhoneVerified = false}) async {
    try {
      // debugger();
      isLoading = true;
      notifyListeners();
      // ignore: unused_local_variable
      user = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      var uid = FirebaseAuth.instance.currentUser!.uid;
      // isEmailVerified = true;
      var data = await FirebaseManager.SignUpFirebaseStoreage(context, name,
          email, password, uid, isEmailVerified, isPhoneVerified);
      isLoading = false;
      notifyListeners();
      UID_Provider.uid = uid.toString();
      // debugger();/
      print(UID_Provider.uid);

      if (user != null) {
        showSnack(context: context, text: "SignUp SuccessFully");
        push(context, SignUpScreenByPhone());
        return data;
      }
    } catch (e) {
      isLoading = false;
      notifyListeners();
      showSnack(
          context: context,
          text: "The email address is already in use by another account.");
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
        PhoneNumber = phoneNumber.toString();
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
      // debugger();
      print(Otp);
      var isVerified = await FirebaseManager.VerifyOTP(verifiedID, Otp);
      // debugger();
      if (isVerified) {
        String? uid = UID_Provider.uid;
        if (uid != null) {
          FirebaseFirestore.instance
              .collection("Client")
              .doc(uid)
              .update({"isPhoneVerified": true});
          pushUntil(context, const LocationScreen());
        }
      }
      isLoading = false;
      notifyListeners();
    } catch (e) {
      print(e.toString());
      showSnack(context: context, text: e.toString());
    }
  }
}
