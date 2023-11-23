import 'package:bhai_chara/controller/services/Firebase_Manager.dart';
import 'package:bhai_chara/utils/push.dart';
import 'package:bhai_chara/utils/showSnack.dart';
import 'package:bhai_chara/view/authentication/location.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpProvider extends ChangeNotifier {
  bool isLoading = false;
  bool isPhoneVf = false;
  String verifiedID = "";
  String OTPCode = "";
  var user;
  SignUpFirebase(context, name, email, password, {isPhoneVerified}) async {
    isLoading = true;
    notifyListeners();
    // ignore: unused_local_variable
    user = FirebaseAuth.instance.currentUser;
    var data = await FirebaseManager.SignUpFirebaseStoreage(
        context, name, email, password, isPhoneVerified);
    isPhoneVerified = isPhoneVf;

    if (data != null) {
      showSnack(context: context, text: "SignUp SuccessFully");
      return data;
    }

    isLoading = false;
    notifyListeners();
  }

  PhoneVerifyFireBase(context, phoneNumber) async {
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
  }

  OTPVerify(context, String Otp) async {
    isLoading = true;
    notifyListeners();
    var isVerified = await FirebaseManager.VerifyOTP(verifiedID, Otp);
    if (isVerified) {
      isPhoneVf = true;
      pushUntil(context, LocationScreen());
    }
    isLoading = false;
    notifyListeners();
  }
}
