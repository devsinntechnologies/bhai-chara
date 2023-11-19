import 'package:bhai_chara/controller/services/Firebase_Manager.dart';
import 'package:bhai_chara/utils/push.dart';
import 'package:bhai_chara/utils/showSnack.dart';
import 'package:bhai_chara/view/home-screens/root_screen.dart';
import 'package:flutter/material.dart';

class SignUpProvider extends ChangeNotifier {
  bool isLoading = false;
  bool isEmailV = false;
  var VerficationId = '';
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

  PhoneVerifyFireBase(context, phoneNumber) async {
    isLoading = true;
    notifyListeners();
    var data =
        await FirebaseManager.PhoneNumberVerification(context, phoneNumber);
    if (data != null) {
      showSnack(context: context, text: "Phone Verified SuccessFully");
      return data;
    }

    isLoading = false;
    notifyListeners();
  }

  OTPVerify(context, String Otp) {
    isLoading = true;
    notifyListeners();
    var isVerified = FirebaseManager.VerifyOTP(Otp);
    if (isVerified) {
      pushUntil(context, RootScreen());
    }
  }
}
