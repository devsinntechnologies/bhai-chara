import 'package:bhai_chara/provider/splash_provider.dart';
import 'package:bhai_chara/view/account/account_screen.dart';
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
          ChangeNotifierProvider(create: (context) => SplashProvider())
        ],
        child: MaterialApp(
          title: "Bhai Chara",
          theme: ThemeData(fontFamily: 'Roboto'),
          home: const AccountScreen(),
        ));
  }
}
