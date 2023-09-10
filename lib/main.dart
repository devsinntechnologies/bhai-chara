import 'package:bhai_chara/provider/splash_provider.dart';
import 'package:bhai_chara/view/authentication/signup_screen_by_email.dart';
import 'package:bhai_chara/view/authentication/signup_screen_by_phone.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => SplashProvider())
        ],
        child: const MaterialApp(
          home: SignupByEmail(),
        ));
  }
}
