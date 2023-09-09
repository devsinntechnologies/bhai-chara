import 'package:bhai_chara/provider/splash_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'view/splash_screen.dart';

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
      child: MaterialApp(home: SplashScreen(),));
  }
}