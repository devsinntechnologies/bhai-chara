import 'package:bhai_chara/provider/splash_provider.dart';
import 'package:bhai_chara/view/onboard_screens/onboard_screen_one.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'view/onboard_screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=> SplashProvider() )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: "Roboto-Regular"),
        home: OnboardScreenOne(),));
  }
}