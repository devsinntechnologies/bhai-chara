import 'package:bhai_chara/provider/authentication_provider/auth_provider.dart';
import 'package:bhai_chara/provider/splash_provider.dart';
import 'package:bhai_chara/view/authentication/signup_screen.dart';
import 'package:bhai_chara/view/authentication/signup_screen_by_email.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => SplashProvider()),
          ChangeNotifierProvider(create: (context) => AuthProvider())

          
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "Bhai Chara",
          theme: ThemeData(fontFamily: 'Roboto'),
          home: const SignupByEmail(),
        ));
  }
}
