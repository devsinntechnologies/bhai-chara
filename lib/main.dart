import 'package:bhai_chara/provider/splash_provider.dart';
import 'package:bhai_chara/view/authentication/create_password.dart';
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
        child: MaterialApp(
          title: "Bhai Chara",
          theme: ThemeData(fontFamily: 'Roboto'),
          home: const CreatePassword(),
        ));
  }
}
