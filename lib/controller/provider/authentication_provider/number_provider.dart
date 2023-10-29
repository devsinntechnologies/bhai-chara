import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../../utils/push.dart';
import '../../../view/authentication/otp_code_screen.dart';

class NumberProvider extends ChangeNotifier {
  bool wait = false;
  Number(context, completeNumber) async {
    wait = true;
    notifyListeners();

    var verify = await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: completeNumber,
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {},
      codeSent: (String verificationId, int? resendToken) {
       // debugger();
        push(context, OTPScreen(phone: completeNumber));
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
    wait = false;
    notifyListeners();
    return verify;
  }
}
