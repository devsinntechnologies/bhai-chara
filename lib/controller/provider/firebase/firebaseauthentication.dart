import 'package:flutter/material.dart';
import '../../../utils/push.dart';
import '../../../view/authentication/signup_screen_by_phone.dart';
import '../../services/Firebase_Manager.dart';

class FireAuthProvider extends ChangeNotifier {
  bool isLoading = false;
  SignUpByGoogle(context) async {
    isLoading = true;
    notifyListeners();
    var data = await FirebaseManager.SignInWithGoogle();

    if (data != null) {
      pushUntil(context, SignUpScreenByPhone());
      return data;
    }
    isLoading = false;
    notifyListeners();
  }
}
