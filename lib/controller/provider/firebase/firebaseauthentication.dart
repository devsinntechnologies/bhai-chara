// import 'package:bhai_chara/common/utils/Navigations.dart';
// import 'package:flutter/material.dart';
// import '../../../utils/push.dart';
// import '../../../view/authentication/signup_screen_by_phone.dart';
// import '../../service/firebase_manager.dart';
// import '../../services/Firebase_Manager.dart';

// class FireAuthProvider extends ChangeNotifier {
//   bool isLoading = false;
//   SignUpByGoogle(context) async {
//     isLoading = true;
//     notifyListeners();
//     var data = await FirebaseManager.SignInWithGoogle(context);

//     if (data != null) {
//       pushUntil(context, SignUpScreenByPhone());
//       return data;
//     }
//     isLoading = false;
//     notifyListeners();
//   }
// }
