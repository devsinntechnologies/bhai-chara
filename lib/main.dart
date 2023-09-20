import 'package:bhai_chara/provider/root_provider.dart';
import 'package:bhai_chara/provider/slider_provider.dart';
import 'package:bhai_chara/provider/visibility_provider.dart';
import 'package:bhai_chara/view/authentication/signup_screen.dart';
import 'package:bhai_chara/view/onboard_screens/splash_screen.dart';
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
          // ChangeNotifierProvider(create: (context) => SplashProvider()),
          ChangeNotifierProvider(create: (context) => RootProvider()),
          ChangeNotifierProvider(create: (context) => visibilityProvider()),
          ChangeNotifierProvider(create: (context) => SliderProvider()),
          // ChangeNotifierProvider(create: (context) => SwitchProvider()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: SignUpScreen(),
          theme: ThemeData(fontFamily: 'Roboto-Regular.ttf'),
        ));
  }
}
